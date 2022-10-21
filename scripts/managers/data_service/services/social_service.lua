local PartyConstants = require("scripts/settings/network/party_constants")
local PlayerCompositions = require("scripts/utilities/players/player_compositions")
local PlayerInfo = require("scripts/managers/data_service/services/social/player_info")
local Promise = require("scripts/foundation/utilities/promise")
local SocialConstants = require("scripts/managers/data_service/services/social/social_constants")
local PartyState = PartyConstants.State
local Platforms = SocialConstants.Platforms
local OnlineStatus = SocialConstants.OnlineStatus
local PartyStatus = SocialConstants.PartyStatus
local FriendStatus = SocialConstants.FriendStatus
local HOST_TYPE_HUB_SERVER = "hub_server"
local HOST_TYPE_MISSION_SERVER = "mission_server"
local SocialService = class("SocialService")

local function _warning(...)
	Log.warning("SocialService", ...)
end

SocialService.init = function (self, backend_interfaces)
	if LEVEL_EDITOR_TEST then
		local SocialDummy = require("scripts/managers/data_service/services/social/social_dummy")
		self._platform_social = SocialDummy:new()
		local InvitesDummy = require("scripts/managers/data_service/services/invites/invites_dummy")
		self._invites = InvitesDummy:new()
	else
		local platform = Managers.presence:presence_entry_myself():platform()
		self._platform = platform

		if platform == Platforms.steam then
			local SocialSteam = require("scripts/managers/data_service/services/social/social_steam")
			self._platform_social = SocialSteam:new()
			local InvitesSteam = require("scripts/managers/data_service/services/invites/invites_steam")
			self._invites = InvitesSteam:new()
		elseif platform == Platforms.xbox then
			local SocialXboxLive = require("scripts/managers/data_service/services/social/social_xbox_live")
			self._platform_social = SocialXboxLive:new()
			local InvitesXboxLive = require("scripts/managers/data_service/services/invites/invites_xbox_live")
			self._invites = InvitesXboxLive:new()
		else
			local SocialDummy = require("scripts/managers/data_service/services/social/social_dummy")
			self._platform_social = SocialDummy:new()
			local InvitesDummy = require("scripts/managers/data_service/services/invites/invites_dummy")
			self._invites = InvitesDummy:new()
		end
	end

	self._backend_interfaces = backend_interfaces.social
	self._friends_list = {}
	self._friends_list_promise = Promise.resolved()
	self._fatshark_friends_promise = Promise.resolved()
	self._friends_list_has_changed = true
	self._num_fatshark_friends = 0
	self._max_fatshark_friends = 0
	self._friend_invites_promise = Promise.resolved()
	self._recent_companions_promise = Promise.resolved()
	self._recent_companions_character_id = nil
	self._players_by_account_id = {}
	self._players_by_platform_user_id = {}
	self._party_members = {}
	self._num_party_members = 0
	self._blocked_accounts_list = {}
	self._blocked_accounts_list_promise = Promise.resolved()
	self._blocked_accounts_list_changed = true
	self._num_blocked_accounts = 0
	self._max_blocked_accounts = 0
	self._blocked_players_list = {}
	self._cb_presence_account_id_change = callback(self, "cb_presence_account_id_change")
end

SocialService.destroy = function (self)
	self._platform_social:delete()

	self._platform_social = nil

	self._invites:delete()

	self._invites = nil
	self._backend_interfaces = nil
end

SocialService.update = function (self, dt, t)
	if self._voting_id and not Managers.voting:voting_exists(self._voting_id) then
		self._voting_id = nil
	end

	self._invites:update()
end

SocialService.platform = function (self)
	return self._platform
end

SocialService.platform_display_name = function (self)
	local platform = self._platform

	if platform == Platforms.steam then
		return "Steam"
	elseif platform == Platforms.xbox then
		return "Xbox Live"
	end

	return ""
end

SocialService.is_in_hub = function (self)
	local host_type = Managers.connection:host_type()

	return host_type == HOST_TYPE_HUB_SERVER
end

SocialService.is_in_mission = function (self)
	local host_type = Managers.connection:host_type()

	return host_type == HOST_TYPE_MISSION_SERVER
end

SocialService.is_in_matchmaking = function (self)
	local immaterium_party_manager = Managers.party_immaterium
	local matchmaking_state = immaterium_party_manager:current_state()
	local is_in_matchmaking = matchmaking_state == PartyState.matchmaking or matchmaking_state == PartyState.matchmaking_acceptance_vote

	return is_in_matchmaking
end

local _temp_team_members = {}

SocialService.fetch_party_members = function (self)
	local promise = Promise:new()
	local temp_team_members = PlayerCompositions.players("party", _temp_team_members)

	if self:is_in_mission() then
		local dont_clear_table = true
		temp_team_members = PlayerCompositions.players("players", _temp_team_members, dont_clear_table)

		for unique_id_1, player_1 in pairs(temp_team_members) do
			for unique_id_2, player_2 in pairs(temp_team_members) do
				if unique_id_2 ~= unique_id_1 then
					local player_1_profile = player_1:profile()
					local player_2_profile = player_2:profile()
					local player_1_character_id = player_1_profile and player_1_profile.character_id
					local player_2_character_id = player_2_profile and player_2_profile.character_id

					if player_1_character_id == player_2_character_id then
						temp_team_members[unique_id_2] = nil
					end
				end
			end
		end

		for unique_id, player in pairs(temp_team_members) do
			if not player:is_human_controlled() then
				temp_team_members[unique_id] = nil
			end
		end
	end

	local party_members = self._party_members

	for current_member_unique_id, current_party_member in pairs(party_members) do
		if not temp_team_members[current_member_unique_id] then
			local player_info = party_members[current_member_unique_id]

			player_info:set_is_party_member(false)

			party_members[current_member_unique_id] = nil
		end
	end

	local num_party_members = 0

	for unique_id, player in pairs(temp_team_members) do
		if not party_members[unique_id] then
			local player_info = self:_get_player_info_for_player(player)

			player_info:set_is_party_member(true)

			party_members[unique_id] = player_info
		end

		num_party_members = num_party_members + 1
	end

	self._num_party_members = num_party_members

	promise:resolve(self._party_members)

	return promise
end

SocialService.fetch_friends = function (self, force_update)
	local platform_friends_manager = self._platform_social
	local friends_list_has_changed = self._friends_list_has_changed or platform_friends_manager:friends_list_has_changes()
	local friends_list_promise = self._friends_list_promise

	if not friends_list_has_changed and not force_update or friends_list_promise:is_pending() then
		return friends_list_promise
	end

	local platform_friends_promise = self:_fetch_platform_friends()
	local fatshark_friends_promise = self:_fetch_fatshark_friends()
	local num_promises = 2

	local function aggregate_function(friends_data)
		local friends = {}
		self._friends_list_has_changed = false

		for friends_data_index = 1, num_promises do
			local friends_data_list = friends_data[friends_data_index]

			if friends_data_list then
				for friends_list_index = 1, #friends_data_list do
					local friend = friends_data_list[friends_list_index]

					if friend:is_friend() then
						local is_duplicate = false

						if friends_data_index > 1 then
							for i = 1, #friends do
								is_duplicate = is_duplicate or friends[i] == friend
							end
						end

						if not is_duplicate then
							friends[#friends + 1] = friend
						end
					end
				end
			else
				self._friends_list_has_changed = true
			end
		end

		self._friends_list = friends

		return friends
	end

	friends_list_promise = Promise.all(platform_friends_promise, fatshark_friends_promise):next(aggregate_function, aggregate_function)
	self._friends_list_promise = friends_list_promise

	return friends_list_promise
end

local _fetch_friend_invites_friend_invites = {}

SocialService.fetch_friend_invites = function (self)
	local friend_invites_promise = self._friend_invites_promise

	if friend_invites_promise:is_pending() then
		return friend_invites_promise
	end

	return self:_fetch_fatshark_friends():next(function (friends_data)
		local friend_invites = _fetch_friend_invites_friend_invites

		if not friends_data then
			return friend_invites
		end

		table.clear_array(friend_invites, #friend_invites)

		local is_invite = FriendStatus.invite
		local is_invited = FriendStatus.invited

		for i = 1, #friends_data do
			local friend = friends_data[i]
			local friend_status = friend:friend_status()

			if friend_status == is_invite or friend_status == is_invited then
				friend_invites[#friend_invites + 1] = friend
			end
		end

		return friend_invites
	end)
end

local _recent_companions = {}

SocialService.fetch_recent_companions = function (self, character_id, force_refresh)
	local recent_companions_promise = self._recent_companions_promise

	if self._recent_companions_character_id == character_id and (not force_refresh or recent_companions_promise:is_pending()) then
		return recent_companions_promise
	end

	recent_companions_promise = self._backend_interfaces:fetch_recently_played(character_id):next(function (data)
		local recent_companions = _recent_companions

		table.clear_array(recent_companions, #recent_companions)

		local recent_participants = data.recentParticipants

		for i = 1, #recent_participants do
			local recent_companion = recent_participants[i]
			local account_id = recent_companion.accountId
			local account_name = recent_companion.accountName
			local player_info = self:_get_player_info_by_account_id(account_id)

			player_info:set_account(account_id, account_name)

			local last_time_played_with = math.floor(tonumber(recent_companion.playedAt) / 1000)

			player_info:set_last_time_played_with(last_time_played_with)

			if not player_info:is_blocked() then
				recent_companions[#recent_companions + 1] = player_info
			end
		end

		return recent_companions
	end):catch(function (error)
		_warning(string.format("Failed fetching recently played with accounts: %s", error))

		return {}
	end)
	self._recent_companions_promise = recent_companions_promise
	self._recent_companions_character_id = character_id

	return recent_companions_promise
end

local _fetch_players_on_server_players_on_server = {}
local _fetch_players_on_server_composition_players = {}

SocialService.fetch_players_on_server = function (self)
	local players_on_server = _fetch_players_on_server_players_on_server
	local composition_players = _fetch_players_on_server_composition_players

	table.clear(players_on_server)

	local promise = Promise:new()
	local is_in_hub = self:is_in_hub()

	if is_in_hub then
		PlayerCompositions.players("players", composition_players)

		local players = Managers.player:human_players()

		for unique_id, player in pairs(players) do
			if player:is_human_controlled() then
				local player_info = self:_get_player_info_for_player(player)

				if not player_info:is_blocked() then
					players_on_server[#players_on_server + 1] = player_info
				end
			end
		end

		promise:resolve(players_on_server)
	else
		promise:reject(players_on_server)
	end

	return promise
end

SocialService.fetch_blocked_accounts = function (self)
	local blocked_accounts_promise = self._blocked_accounts_list_promise

	if self._blocked_accounts_list_changed and not blocked_accounts_promise:is_pending() then
		blocked_accounts_promise = self._backend_interfaces:fetch_blocked_accounts():next(function (data)
			self._max_blocked_accounts = data.maxBlocks
			local blocked_accounts = data.blockList

			self:_update_blocked_players(blocked_accounts)

			self._blocked_accounts_list_changed = false

			return blocked_accounts
		end)
		self._blocked_accounts_list_promise = blocked_accounts_promise
	end

	return blocked_accounts_promise:catch(function (error)
		_warning(string.format("Failed fetching blocked accounts: %s", error))
	end)
end

SocialService.fetch_blocked_players = function (self)
	return self:fetch_blocked_accounts():next(function (data)
		return self._blocked_players_list
	end):catch(function (error)
		_warning(string.format("Failed fetching blocked accounts: %s", error))
	end)
end

SocialService.has_invite = function (self)
	return self._invites:has_invite()
end

SocialService.get_invite = function (self)
	return self._invites:get_invite()
end

SocialService.can_join_party = function (self, player_info)
	if player_info:online_status() ~= OnlineStatus.online then
		return false, nil
	end

	local player_party_id = player_info:party_id()

	if not player_party_id then
		return false, nil
	end

	local player_party_status = player_info:party_status()

	if player_party_status == PartyStatus.mine then
		local reason = "loc_social_party_join_rejection_reason_same_party"

		return false, reason
	elseif player_party_status == PartyStatus.invite_pending then
		local reason = "loc_social_party_join_rejection_reason_invite_pending"

		return false, reason
	end

	if player_info:player_activity_id() == "mission" then
		local player_num_party_members = player_info:num_mission_members()

		if player_num_party_members == SocialConstants.max_num_party_members then
			local reason = "loc_social_party_join_rejection_reason_party_full"

			return false, reason
		end
	else
		local player_num_party_members = player_info:num_party_members()

		if player_num_party_members == SocialConstants.max_num_party_members then
			local reason = "loc_social_party_join_rejection_reason_party_full"

			return false, reason
		end
	end

	if self:is_in_matchmaking() then
		local reason = "loc_social_party_join_rejection_reason_you_are_in_matchmaking"

		return false, reason
	end

	return true
end

SocialService.can_invite_to_party = function (self, player_info)
	local player_online_status = player_info:online_status()

	if player_online_status ~= OnlineStatus.online and player_online_status ~= OnlineStatus.platform_online then
		return false, nil
	end

	local player_party_status = player_info:party_status()

	if player_party_status == PartyStatus.mine then
		local reason = "loc_social_party_join_rejection_reason_same_party"

		return false, reason
	elseif player_party_status == PartyStatus.invite_pending then
		local reason = "loc_social_party_join_rejection_reason_invite_pending"

		return false, reason
	end

	local player_num_party_members = self._num_party_members

	if player_num_party_members == SocialConstants.max_num_party_members then
		local reason = "loc_social_party_join_rejection_reason_party_full"

		return false, reason
	end

	if player_info:player_activity_id() == "mission" then
		local reason = "loc_social_party_join_rejection_reason_player_in_mission"

		return false, reason
	end

	if self:is_in_matchmaking() then
		local reason = "loc_social_party_join_rejection_reason_you_are_in_matchmaking"

		return false, reason
	end

	return true
end

SocialService.send_party_invite = function (self, invitee_player_info)
	local player_online_status = invitee_player_info:online_status()

	if player_online_status == OnlineStatus.online then
		Managers.party_immaterium:invite_to_party(invitee_player_info:account_id()):catch(function (error)
			_warning("invite_to_party failed with " .. table.tostring(error, 3))
		end)
	elseif player_online_status == OnlineStatus.platform_online then
		local party_id = Managers.party_immaterium:party_id()
		local platform_user_id = invitee_player_info:platform_user_id()

		if party_id and platform_user_id then
			self._invites:send_invite(platform_user_id, party_id)
		end
	end
end

SocialService.cancel_party_invite = function (self, invitee_player_info)
	Managers.party_immaterium:cancel_party_invite(invitee_player_info:account_id())
end

SocialService.join_party = function (self, party_id)
	return Managers.party_immaterium:join_party(party_id)
end

SocialService.leave_party = function (self)
	Managers.party_immaterium:leave_party()
end

SocialService.can_kick_from_party = function (self, player_info)
	local party_status = player_info:party_status()

	if party_status ~= PartyStatus.same_mission and party_status ~= PartyStatus.mine then
		return false
	end

	if self._num_party_members < SocialConstants.min_num_party_members_to_vote then
		return false, "loc_social_fail_too_few_to_kick_vote"
	end

	return true
end

SocialService.initiate_kick_vote = function (self, player_info)
	local peer_id = player_info:peer_id()

	if self._voting_id or not peer_id then
		return
	end

	local party_status = player_info:party_status()
	local is_in_mission = self:is_in_mission()
	local voting_template = nil

	if is_in_mission and (party_status == PartyStatus.same_mission or party_status == PartyStatus.mine) then
		voting_template = "kick_from_mission"
	end

	if voting_template then
		Managers.voting:start_voting(voting_template, {
			kick_peer_id = peer_id
		}):next(function (data)
			self._voting_id = data
		end):catch(function (fail_reason)
			Log.info("SocialService", fail_reason)

			self._voting_id = nil
		end)
	end
end

SocialService.can_befriend = function (self)
	if self._max_fatshark_friends <= self._num_fatshark_friends then
		local reason = "loc_social_cannot_befriend_reason_max_num_friends"

		return false, reason
	end

	return true
end

SocialService.send_friend_request = function (self, account_id)
	local player_info = self._players_by_account_id[account_id]
	local friend_status = nil

	if player_info then
		friend_status = player_info:friend_status()

		player_info:set_friend_status(FriendStatus.invited)
	end

	return self._backend_interfaces:send_friend_request(account_id, "POST"):next(function (data)
		self._friends_list_has_changed = true
	end):catch(function (error)
		_warning(string.format("Failed sending friend request to %s: %s", account_id, error))

		if player_info and friend_status then
			player_info:set_friend_status(friend_status)
		end
	end)
end

SocialService.accept_friend_request = function (self, account_id)
	local player_info = self._players_by_account_id[account_id]
	local friend_status = nil

	if player_info then
		friend_status = player_info:friend_status()

		player_info:set_friend_status(FriendStatus.friend)
	end

	return self._backend_interfaces:send_friend_request(account_id, "PUT"):next(function (data)
		self._friends_list_has_changed = true
	end):catch(function (error)
		_warning(string.format("Failed sending friend request to %s: %s", account_id, error))

		if player_info and friend_status then
			player_info:set_friend_status(friend_status)
		end
	end)
end

SocialService.reject_friend_request = function (self, account_id)
	local player_info = self._players_by_account_id[account_id]
	local friend_status = nil

	if player_info then
		friend_status = player_info:friend_status()

		player_info:set_friend_status(FriendStatus.none)
	end

	return self._backend_interfaces:send_friend_request(account_id, "PATCH"):next(function (data)
		self._friends_list_has_changed = true
	end):catch(function (error)
		_warning(string.format("Failed sending friend request to %s: %s", account_id, error))
	end)
end

SocialService.cancel_friend_request = function (self, account_id)
	local player_info = self._players_by_account_id[account_id]

	if player_info then
		player_info:set_friend_status(FriendStatus.none)
	end

	return self._backend_interfaces:send_friend_request(account_id, "DELETE"):next(function (data)
		player_info:set_friend_status(FriendStatus.none)

		self._friends_list_has_changed = true
	end):catch(function (error)
		_warning(string.format("Failed canceling friend request to %s: %s", account_id, error))
	end)
end

SocialService.unfriend_player = function (self, account_id)
	local player_info = self._players_by_account_id[account_id]
	local friend_status = nil

	if player_info then
		friend_status = player_info:friend_status()

		player_info:set_friend_status(FriendStatus.none)
	end

	return self._backend_interfaces:unfriend_player(account_id):next(function (data)
		player_info:set_friend_status(FriendStatus.none)

		self._friends_list_has_changed = true
	end):catch(function (error)
		_warning(string.format("Failed to un-friend %s: %s", account_id, error))
	end)
end

SocialService.has_unread_notifications = function (self)
	return self._invites:has_invite()
end

SocialService.can_mute_player_in_text_chat = function (self, account_id)
	local player_info = account_id and self._players_by_account_id[account_id]

	if not player_info or player_info:online_status() ~= OnlineStatus.online then
		local reason = "loc_social_fail_reason_user_not_online"

		return false, reason
	end

	return false, "loc_social_fail_reason_not_implemented"
end

SocialService.mute_player_in_text_chat = function (self, account_id, is_muted)
	local player_info = self:_get_player_info_by_account_id(account_id)

	player_info:set_is_text_muted(is_muted)
end

SocialService.can_mute_player_in_voice_chat = function (self, account_id)
	local player_info = account_id and self._players_by_account_id[account_id]

	if not player_info or player_info:online_status() ~= OnlineStatus.online then
		local reason = "loc_social_fail_reason_user_not_online"

		return false, reason
	end

	return false, "loc_social_fail_reason_not_implemented"
end

SocialService.mute_player_in_voice_chat = function (self, account_id, is_muted)
	local player_info = self:_get_player_info_by_account_id(account_id)

	player_info:set_is_voice_muted(is_muted)
end

SocialService.can_block = function (self, account_id)
	local player_info = account_id and self._players_by_account_id[account_id]

	if not player_info or player_info:online_status() ~= OnlineStatus.online then
		local reason = "loc_social_fail_reason_user_not_online"

		return false, reason
	elseif self._max_blocked_accounts <= self._num_blocked_accounts then
		local reason = "loc_social_cannot_block_reason_max_num_reached"

		return false, reason
	end

	return true
end

SocialService.is_account_blocked = function (self, account_id)
	return self:fetch_blocked_accounts():next(function (blocked_accounts)
		return blocked_accounts[account_id] ~= nil
	end)
end

SocialService.block_account = function (self, account_id)
	local player_info = self._players_by_account_id[account_id]

	if player_info then
		player_info:set_is_blocked(true)

		self._friends_list_has_changed = true
		self._blocked_accounts_list_changed = true
	end

	return self._backend_interfaces:add_blocked_account(account_id):catch(function (error)
		_warning(string.format("Failed blocking account %s: %s", account_id, error))

		if player_info then
			player_info:set_is_blocked(false)

			self._friends_list_has_changed = true
			self._blocked_accounts_list_changed = true
		end
	end)
end

SocialService.unblock_account = function (self, account_id)
	local player_info = self._players_by_account_id[account_id]

	if player_info then
		player_info:set_is_blocked(false)

		self._friends_list_has_changed = true
		self._blocked_accounts_list_changed = true
	end

	return self._backend_interfaces:remove_blocked_account(account_id):catch(function (error)
		_warning(string.format("Failed unblocking account %s: %s", account_id, error))
	end)
end

SocialService._fetch_platform_friends = function (self)
	local platform_friends_manager = self._platform_social

	return platform_friends_manager:fetch_friends_list():next(function (platform_friends_data)
		local friends = {}

		for i = 1, #platform_friends_data do
			local friend = platform_friends_data[i]
			local player_info = self:_get_player_info_by_platform_friend(friend)
			friends[i] = player_info
		end

		return friends
	end):catch(function (error)
		_warning(string.format("Failed fetching %s friends: %s", self._platform, error))
	end)
end

SocialService.fetch_platform_block_list_ids_forced = function (self)
	local platform_friends_manager = self._platform_social

	return platform_friends_manager:fetch_blocked_list_ids_forced()
end

SocialService._fetch_fatshark_friends = function (self)
	local fatshark_friends_promise = self._fatshark_friends_promise

	if fatshark_friends_promise:is_pending() then
		return fatshark_friends_promise
	end

	fatshark_friends_promise = self._backend_interfaces:fetch_friends():next(function (fatshark_friends_data)
		self._max_fatshark_friends = fatshark_friends_data.maxFriends
		local fatshark_friends = fatshark_friends_data.friends
		local friends = {}

		for i = 1, #fatshark_friends do
			local friend_data = fatshark_friends[i]
			local account_id = friend_data.accountId
			local account_name = friend_data.accountName
			local friend_status = friend_data.status
			local player_info = self:_get_player_info_by_account_id(account_id)

			player_info:set_account(account_id, account_name)
			player_info:set_friend_status(friend_status)

			friends[i] = player_info
		end

		if #friends ~= self._num_fatshark_friends then
			self._num_fatshark_friends = #friends
			self._friends_list_has_changed = true
		end

		return friends
	end):catch(function (error)
		_warning(string.format("Failed fetching fatshark friends: %s", error))
	end)
	self._fatshark_friends_promise = fatshark_friends_promise

	return fatshark_friends_promise
end

SocialService._update_blocked_players = function (self, blocked_accounts)
	local blocked_players_list = self._blocked_players_list

	table.clear_array(blocked_players_list, #blocked_players_list)

	local previous_blocked_players = self._blocked_accounts_list
	local players_by_account_id = self._players_by_account_id

	for account_id, account_info in pairs(blocked_accounts) do
		local account_name = account_info.accountName
		previous_blocked_players[account_id] = nil
		local player_info = self:_get_player_info_by_account_id(account_id)

		player_info:set_account(account_id, account_name)
		player_info:set_is_blocked(true)

		blocked_players_list[#blocked_players_list + 1] = player_info
	end

	for account_id in pairs(previous_blocked_players) do
		local player_info = players_by_account_id[account_id]

		if player_info then
			player_info:set_is_blocked(false)
		end
	end

	self._blocked_accounts_list = blocked_accounts
	self._num_blocked_accounts = #blocked_players_list
end

SocialService._get_player_info_for_player = function (self, player)
	local account_id = player:account_id()
	local player_info = self:_get_player_info_by_account_id(account_id)

	return player_info
end

SocialService._get_player_info_by_platform_friend = function (self, friend)
	local players_by_platform_user_id = self._players_by_platform_user_id
	local platform_user_id = friend:id()
	local player_info = players_by_platform_user_id[platform_user_id]

	if not player_info then
		player_info = PlayerInfo:new(self._cb_presence_account_id_change)
		players_by_platform_user_id[platform_user_id] = player_info
	end

	player_info:set_platform_social(friend)

	return player_info
end

SocialService._get_player_info_by_account_id = function (self, account_id)
	local players_by_account_id = self._players_by_account_id
	local player_info = players_by_account_id[account_id]

	if not player_info then
		player_info = PlayerInfo:new(self._cb_presence_account_id_change)

		player_info:set_account(account_id)

		players_by_account_id[account_id] = player_info
	end

	return player_info
end

SocialService.cb_presence_account_id_change = function (self, updated_player_info)
	local account_id = updated_player_info:account_id()
	local player_info = self._players_by_account_id[account_id]

	if not player_info then
		self._players_by_account_id[account_id] = updated_player_info
		player_info = updated_player_info
	end

	local platform_social = updated_player_info:platform_social()

	if platform_social then
		if platform_social ~= player_info:platform_social() then
			player_info:set_platform_social(platform_social)
		end

		self._players_by_platform_user_id[account_id] = player_info
	end

	self._friends_list_has_changed = true
end

return SocialService