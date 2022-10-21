local BotSpawning = require("scripts/managers/bot/bot_spawning")
local Breed = require("scripts/utilities/breed")
local DebugSingleton = require("scripts/foundation/utilities/debug/debug_singleton")
local FixedFrame = require("scripts/utilities/fixed_frame")
local GameModeSettings = require("scripts/settings/game_mode/game_mode_settings")
local MasterItems = require("scripts/backend/master_items")
local PlayerCharacterConstants = require("scripts/settings/player_character/player_character_constants")
local Promise = require("scripts/foundation/utilities/promise")
local ui_manager = nil
local WEAPON_CATEGORY = "Player Equipment - Weapons"
local SHIPPABLE_DESCRIPTION = " (SHIPPABLE: READY FOR RELEASE)"
local FUNCTIONAL_DESCRIPTION = " (FUNCTIONAL: READY FOR TESTING)"
local PROTOTYPE_DESCRIPTION = " (PROTOTYPE: DON'T USE IN TESTS OR REPORT ISSUES)"
local BLOCKOUT_DESCRIPTION = " (BLOCKOUT: ONLY FOR USE BY WEAPON ART OR COMBAT TEAM)"
local categories = {
	"Achievements",
	"Ailments",
	"Bot Character",
	"Buffs",
	"Coherency Buffs",
	"Dev Parameters",
	"Error",
	"Free Flight Camera",
	"Game Mode",
	"Immaterium (Party)",
	"Level & Mission",
	"Marketing",
	"Navigation",
	"Network",
	"Pacing",
	"Player Character",
	"Player Equipment - Boons",
	"Player Equipment - Emotes",
	"Player Equipment - Gear",
	WEAPON_CATEGORY .. SHIPPABLE_DESCRIPTION,
	WEAPON_CATEGORY .. FUNCTIONAL_DESCRIPTION,
	WEAPON_CATEGORY .. PROTOTYPE_DESCRIPTION,
	WEAPON_CATEGORY .. BLOCKOUT_DESCRIPTION,
	"Player Equipment",
	"Player Inventory",
	"Player Profiles",
	"Player Voice",
	"Progression",
	"Stagger",
	"Sweep Spline",
	"Time",
	"UI",
	"Unit",
	"VO",
	"WeaponTraits"
}
local functions = {}

local function _apply_ailment(unit, ailment_effect)
	local Ailment = require("scripts/utilities/ailment")
	local include_children = true

	Ailment.play_ailment_effect_template(unit, ailment_effect, include_children)

	local visual_loadout_extension = ScriptUnit.has_extension(unit, "visual_loadout_system")

	if visual_loadout_extension then
		visual_loadout_extension:set_ailment_effect(ailment_effect)
	end
end

local function ailment_options()
	local AilmentSettings = require("scripts/settings/ailments/ailment_settings")
	local ailment_effect_names = table.keys(AilmentSettings.effects)

	table.sort(ailment_effect_names)

	return ailment_effect_names
end

local function apply_ailment_to_selected_unit(new_value)
	local selected_unit = Debug.selected_unit

	if not ALIVE[selected_unit] then
		return
	end

	_apply_ailment(selected_unit, new_value)
end

functions.apply_ailment_to_selected_unit = {
	name = "Play Ailment Effect On Selected Unit",
	category = "Ailments",
	options_function = ailment_options,
	on_activated = apply_ailment_to_selected_unit
}

local function buff_options()
	local BuffTemplates = require("scripts/settings/buff/buff_templates")
	local buff_names = table.keys(BuffTemplates)

	table.sort(buff_names)

	return buff_names
end

local function _apply_buff(unit, new_value)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return
	end

	local fixed_t = FixedFrame.get_latest_fixed_time()

	buff_extension:debug_add_buff(new_value, fixed_t)
end

local function apply_buff_to_self(new_value)
	local local_player = Managers.player:local_player(1)
	local local_player_unit = local_player.player_unit

	_apply_buff(local_player_unit, new_value)
end

functions.apply_buff_to_self = {
	name = "Apply Buff To Self",
	category = "Buffs",
	options_function = buff_options,
	on_activated = apply_buff_to_self
}

local function apply_buff_to_selected_unit(new_value)
	local selected_unit = Debug.selected_unit

	if not ALIVE[selected_unit] then
		return
	end

	_apply_buff(selected_unit, new_value)
end

functions.apply_buff_to_selected_unit = {
	name = "Apply Buff To Selected Unit",
	category = "Buffs",
	options_function = buff_options,
	on_activated = apply_buff_to_selected_unit
}

local function _remove_all_buffs(unit)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return
	end

	buff_extension:debug_remove_all_buffs()
end

local function remove_buffs_from_self()
	local local_player = Managers.player:local_player(1)
	local local_player_unit = local_player.player_unit

	_remove_all_buffs(local_player_unit)
end

functions.remove_buffs_from_self = {
	name = "Remove Buffs From Self",
	category = "Buffs",
	on_activated = remove_buffs_from_self
}

local function remove_buffs_from_selected_unit(new_value, old_value)
	local selected_unit = Debug.selected_unit

	if not ALIVE[selected_unit] then
		return
	end

	_remove_all_buffs(selected_unit)
end

functions.remove_buffs_from_selected_unit = {
	name = "Remove Buffs From Selected Unit",
	category = "Buffs",
	on_activated = remove_buffs_from_selected_unit
}

local function buff_index_options()
	local options = {}

	for i = 1, 20 do
		options[i] = i
	end

	return options
end

local function _remove_specific_buff(unit, index)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return
	end

	buff_extension:debug_remove_buff(index)
end

local function remove_specific_buff_from_self(new_value)
	local local_player = Managers.player:local_player(1)
	local local_player_unit = local_player.player_unit

	_remove_specific_buff(local_player_unit, new_value)
end

functions.remove_specific_buff_from_self = {
	name = "Remove Specific Buff From Self",
	category = "Buffs",
	options_function = buff_index_options,
	on_activated = remove_specific_buff_from_self
}

local function remove_specific_buff_from_selected_unit(new_value)
	local selected_unit = Debug.selected_unit

	if not ALIVE[selected_unit] then
		return
	end

	_remove_specific_buff(selected_unit, new_value)
end

functions.remove_specific_buff_from_selected_unit = {
	name = "Remove Specific Buff From Selected Unit",
	category = "Buffs",
	options_function = buff_index_options,
	on_activated = remove_specific_buff_from_selected_unit
}

local function buff_group_options()
	local BuffSettings = require("scripts/settings/buff/buff_settings")
	local buff_group_names = table.keys(BuffSettings.debug_buff_groups)

	table.sort(buff_group_names)

	return buff_group_names
end

local function _apply_buff_group(unit, new_value)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return
	end

	local BuffSettings = require("scripts/settings/buff/buff_settings")
	local group = BuffSettings.debug_buff_groups[new_value]
	local fixed_t = FixedFrame.get_latest_fixed_time()

	for i = 1, #group do
		local buff_name = group[i]

		buff_extension:debug_add_buff(buff_name, fixed_t)
	end
end

local function apply_buff_group_to_self(new_value)
	local local_player = Managers.player:local_player(1)
	local local_player_unit = local_player.player_unit

	_apply_buff_group(local_player_unit, new_value)
end

functions.apply_buff_group_to_self = {
	name = "Apply Buff Group To Self",
	category = "Buffs",
	options_function = buff_group_options,
	on_activated = apply_buff_group_to_self
}

local function apply_buff_group_to_selected_unit(new_value)
	local selected_unit = Debug.selected_unit

	if not ALIVE[selected_unit] then
		return
	end

	_apply_buff_group(selected_unit, new_value)
end

functions.apply_buff_group_to_selected_unit = {
	name = "Apply Buff Group To Selected Unit",
	category = "Buffs",
	options_function = buff_group_options,
	on_activated = apply_buff_group_to_selected_unit
}
functions.apply_coherency_buff_to_self = {
	name = "Apply Coherency Buff To Self",
	category = "Coherency Buffs",
	options_function = buff_options,
	on_activated = function (new_value)
		local local_player = Managers.player:local_player(1)
		local local_player_unit = local_player.player_unit

		Debug:add_coherency_buff_to_unit(local_player_unit, new_value)
	end
}
functions.apply_coherency_buff_to_selected_unit = {
	name = "Apply Coherency Buff To Selected Unit",
	category = "Coherency Buffs",
	options_function = buff_options,
	on_activated = function (new_value)
		local selected_unit = Debug.selected_unit

		Debug:add_coherency_buff_to_unit(selected_unit, new_value)
	end
}
functions.remove_buffs_from_self = {
	name = "Remove Coherency Buffs From Self",
	category = "Coherency Buffs",
	on_activated = function ()
		local local_player = Managers.player:local_player(1)
		local local_player_unit = local_player.player_unit

		Debug:remove_coherency_buffs_from_unit(local_player_unit)
	end
}
functions.remove_buffs_from_selected_unit = {
	name = "Remove Coherency Buffs From Selected Unit",
	category = "Coherency Buffs",
	on_activated = function (new_value, old_value)
		local selected_unit = Debug.selected_unit

		if not ALIVE[selected_unit] then
			return
		end

		Debug:remove_coherency_buffs_from_unit(selected_unit)
	end
}
functions.prepare_ui_for_marketing = {
	name = "Prepare UI for marketing",
	category = "Marketing",
	on_activated = function ()
		if not Managers.state or not Managers.state.game_session or Managers.state.game_session:is_server() or not Managers.connection then
			return
		end

		local ParameterResolver = require("scripts/foundation/utilities/parameters/parameter_resolver")

		ParameterResolver.set_dev_parameter("hide_hud", true)
		ParameterResolver.set_dev_parameter("render_version_info", false)
		ParameterResolver.set_dev_parameter("show_ingame_fps", false)
		ParameterResolver.set_dev_parameter("render_feature_info", false)
		ParameterResolver.set_dev_parameter("debug_text_enable", false)
		ParameterResolver.set_dev_parameter("enemy_outlines", "off")
		ParameterResolver.set_dev_parameter("player_outlines_mode", "off")
		ParameterResolver.set_dev_parameter("disable_outlines", true)
	end
}
functions.prepare_gameplay_for_marketing = {
	name = "Prepare gameplay for marketing",
	category = "Marketing",
	on_activated = function ()
		if not Managers.state or not Managers.state.game_session or Managers.state.game_session:is_server() or not Managers.connection then
			return
		end

		local ParameterResolver = require("scripts/foundation/utilities/parameters/parameter_resolver")
		local channel = Managers.connection:host_channel()

		ParameterResolver.set_dev_parameter("allow_server_control_from_client", true)
		ParameterResolver.set_dev_parameter("no_ability_cooldowns", true)
		ParameterResolver.set_dev_parameter("infinite_ammo_reserve", true)
		ParameterResolver.set_dev_parameter("debug_players_invulnerable", true)
		ParameterResolver.set_dev_parameter("disable_pacing", true)
		RPC.rpc_debug_client_request_no_ability_cooldowns(channel, true)
		RPC.rpc_debug_client_request_infinite_ammo_reserve(channel, true)
		RPC.rpc_debug_client_request_set_players_invulnerable(channel, true)
		RPC.rpc_debug_client_request_disable_pacing(channel, true)
	end
}
functions.reload_current_level = {
	name = "Reload Current Level",
	category = "Level & Mission",
	on_activated = function ()
		local is_server = Managers.state.game_session:is_server()

		if is_server then
			Debug.reload_level = true
		else
			local channel = Managers.connection:host_channel()

			RPC.rpc_debug_client_request_reload_level(channel)
		end
	end
}

local function list_mission_options(dev)
	local Missions = require("scripts/settings/mission/mission_templates")
	local mission_keys = {}

	for key, mission in pairs(Missions) do
		if not dev and not mission.is_dev_mission or dev and mission.is_dev_mission then
			mission_keys[#mission_keys + 1] = key
		end
	end

	table.sort(mission_keys)

	return mission_keys
end

local function mission_options()
	local dev = false

	return list_mission_options(dev)
end

local function mission_options_dev()
	local dev = true

	return list_mission_options(dev)
end

local function circumstance_options()
	local CircumstanceTemplates = require("scripts/settings/circumstance/circumstance_templates")
	local circumstances = {
		"default"
	}

	for circumstance_name, _ in pairs(CircumstanceTemplates) do
		if circumstance_name ~= "default" then
			circumstances[#circumstances + 1] = circumstance_name
		end
	end

	return circumstances
end

local function side_mission_options()
	local mission_objective_templates = require("scripts/settings/mission_objective/templates/side_mission_objective_template")
	local side_missions = {
		"default"
	}

	for side_mission, _ in pairs(mission_objective_templates.side_mission.objectives) do
		if side_mission ~= "default" then
			side_missions[#side_missions + 1] = side_mission
		end
	end

	return side_missions
end

local function array_concat(a1, a2)
	for i = 1, #a2 do
		a1[#a1 + 1] = a2[i]
	end

	return a1
end

local function start_mission_level(new_value, old_value)
	local mechanism_context = {
		mission_name = new_value
	}
	local Missions = require("scripts/settings/mission/mission_templates")
	local mission_settings = Missions[new_value]
	local mechanism_name = mission_settings.mechanism_name
	local game_mode_name = mission_settings.game_mode_name
	local game_mode_settings = GameModeSettings[game_mode_name]

	if game_mode_settings.host_singleplay then
		Managers.multiplayer_session:boot_singleplayer_session()
	end

	local is_host = Managers.connection:is_host()

	if is_host then
		Managers.connection:reset_seed()
	end

	Managers.mechanism:change_mechanism(mechanism_name, mechanism_context)
	Managers.mechanism:trigger_event("all_players_ready")
end

local function start_free_flight_follow_main_path(new_value, old_value)
	local free_flight_manager = Managers.free_flight

	if free_flight_manager then
		free_flight_manager:toggle_follow_path(new_value)
	end
end

functions.free_flight_follow_main_path = {
	name = "Follow Main Path",
	category = "Free Flight Camera",
	on_activated = start_free_flight_follow_main_path
}
functions.start__mission = {
	name = "Start Missions",
	category = "Level & Mission",
	options_function = mission_options,
	on_activated = start_mission_level
}
functions.start_dev_mission = {
	name = "Start Missions (DEV)",
	category = "Level & Mission",
	options_function = mission_options_dev,
	on_activated = start_mission_level
}
functions.teleport_to_portal = {
	name = "Teleport To Portal",
	category = "Level & Mission",
	dynamic_contents = true,
	options_function = DebugSingleton.teleport_to_portal_list,
	on_activated = DebugSingleton.teleport_to_portal
}
functions.teleport_to_player = {
	name = "Teleport To Player",
	category = "Level & Mission",
	dynamic_contents = true,
	options_function = DebugSingleton.teleport_to_player_list,
	on_activated = DebugSingleton.teleport_to_player
}

local function _print_camera_teleport_cmd()
	local player = Managers.player:local_player(1)
	local camera_manager = Managers.state.camera
	local free_flight_manager = Managers.free_flight
	local camera_pos, camera_rot = nil

	if free_flight_manager and free_flight_manager:is_in_free_flight() then
		camera_pos, camera_rot = free_flight_manager:camera_position_rotation("global")
	elseif camera_manager and player then
		local viewport_name = player.viewport_name
		local camera = camera_manager:camera(viewport_name)

		if camera then
			camera_pos = camera_manager:camera_position(viewport_name)
			camera_rot = camera_manager:camera_rotation(viewport_name)
		end
	end

	if camera_pos and camera_rot then
		local viewport_name = player.viewport_name
		local camera = camera_manager:camera(viewport_name)

		if camera then
			local yaw = Quaternion.yaw(camera_rot)
			local pitch = Quaternion.pitch(camera_rot)
			local roll = Quaternion.roll(camera_rot)
			local camera_position_string = string.format("Vector3(%.2f, %.2f, %.2f)", camera_pos.x, camera_pos.y, camera_pos.z)
			local camera_rotation_string = string.format("Quaternion.from_yaw_pitch_roll(%.4f, %.4f, %.4f)", yaw, pitch, roll)

			Log.info("DebugFunctions", "DebugSingleton.teleport_to_coordinates(%s,  %s)", camera_position_string, camera_rotation_string)
		else
			Log.info("DebugFunctions", "No camera available.")
		end
	end
end

functions.print_location_info = {
	name = "Print Camera Teleport Command",
	category = "Level & Mission",
	on_activated = _print_camera_teleport_cmd
}
functions.teleport_to_coordinates = {
	width = 150,
	name = "Teleport to Coordinates",
	category = "Level & Mission",
	button_text = "Teleport",
	vector3_input = true,
	on_activated = DebugSingleton.teleport_to_coordinates
}
local mission_board_error_text = "Failed fetching missions"
local mission_board_options = {}
local mission_board_ids = {}

local function _fetch_mission_board()
	table.clear(mission_board_options)
	table.clear(mission_board_ids)

	if not Managers.backend:authenticated() then
		mission_board_options[1] = mission_board_error_text

		Log.info("DebugFunctions", "Fetching mission board failed, not authenticated")

		return
	end

	local missions_future = Managers.data_service.mission_board:fetch()

	missions_future:next(function (data)
		local missions = data.missions

		for i = 1, #missions do
			local mission = missions[i]
			local text = string.format("%s. %s (chl %s res %s)", i, mission.map, mission.challenge, mission.resistance)
			mission_board_options[#mission_board_options + 1] = text
			mission_board_ids[text] = mission.id
		end
	end):catch(function (error)
		mission_board_options[1] = mission_board_error_text

		Log.info("DebugFunctions", "Fetching mission board failed, %s", error)
	end)
end

functions.mission_board_start_debug_mission = {
	name = "Start Debug Mission Board",
	category = "Level & Mission",
	debug_mission_input = true,
	on_activated = function (debug_mission)
		Managers.data_service.mission_board:create_debug_mission(debug_mission.map, debug_mission.challenge, debug_mission.resistance, debug_mission.circumstance_name, debug_mission.side_mission):next(function (mission)
			local mission_id = mission.id

			Managers.party_immaterium:wanted_mission_selected(mission_id)
		end):catch(function (error)
			Log.error("DebugFunctions", "Could not create debug mission " .. table.tostring(error, 5))
		end)
	end,
	maps = array_concat(mission_options(), mission_options_dev()),
	circumstances = circumstance_options(),
	side_missions = side_mission_options(),
	default_value = {
		map = "combat",
		resistance = 3,
		side_mission = "default",
		challenge = 3,
		circumstance_name = "default"
	}
}
functions.mission_board_start_mission = {
	name = "Mission Board",
	category = "Level & Mission",
	dynamic_contents = true,
	options_function = function ()
		return mission_board_options
	end,
	on_activated = function (selected_option)
		if selected_option ~= mission_board_error_text then
			local backend_mission_id = mission_board_ids[selected_option]

			Managers.party_immaterium:wanted_mission_selected(backend_mission_id)
		end
	end
}
functions.mission_board_update_missions = {
	name = "Mission Board Update",
	category = "Level & Mission",
	on_activated = _fetch_mission_board
}

local function _init_spawn_bot_character(item_definitions)
	local function options_function()
		local num_bot_profiles = 0
		local bot_profile_names = {}
		local BotCharacterProfiles = require("scripts/settings/bot_character_profiles")
		local profiles = BotCharacterProfiles(item_definitions)

		for profile_name, _ in pairs(profiles) do
			num_bot_profiles = num_bot_profiles + 1
			bot_profile_names[num_bot_profiles] = profile_name
		end

		table.sort(bot_profile_names)

		return bot_profile_names
	end

	local function spawn_bot_character(new_value, old_value)
		BotSpawning.spawn_bot_character(new_value)
	end

	functions.spawn_bot_character = {
		name = "Spawns a bot character.",
		category = "Bot Character",
		options_function = options_function,
		on_activated = spawn_bot_character
	}
end

local function remove_bot_character()
	local is_server = Managers.state.game_session:is_server()

	if is_server then
		BotSpawning.despawn_best_bot()
	else
		Managers.connection:send_rpc_server("rpc_debug_remove_bot")
	end
end

functions.remove_bot_character = {
	name = "Remove a bot character.",
	category = "Bot Character",
	on_activated = remove_bot_character
}

local function init_nav_visual_server()
	local nav_world = Debug:nav_world()

	if nav_world then
		GwNavWorld.init_visual_debug_server(nav_world, 4888)
	end
end

functions.initialize_navigation_visual_debug_server = {
	name = "Initialize Visual Debug Server.",
	category = "Navigation",
	on_activated = init_nav_visual_server
}

local function _crash_server()
	if not Managers.state.game_session then
		Log.info("DebugFunctions", "Trying to crash server without a game_session")

		return
	end

	local user_name = HAS_STEAM and Steam.user_name() or Application.machine_id()
	local is_server = Managers.state.game_session:is_server()

	if is_server then
		Managers.state.game_session:debug_crash_server(user_name)
	else
		Managers.state.game_session:send_rpc_server("rpc_debug_crash_server", user_name)
	end
end

functions.crash_server = {
	name = "Crash Server",
	category = "Network",
	on_activated = function ()
		_crash_server()
	end
}
local _is_disconnected = false

local function _disconnect(seconds)
	if _is_disconnected then
		return
	end

	_is_disconnected = true

	Network.set_max_transmit_rate(10 * seconds)

	local title_request = Managers.backend.title_request
	local url_request = Managers.backend.url_request
	Managers.backend.title_request = Managers.backend.failed_request
	Managers.backend.url_request = Managers.backend.failed_request

	Promise.delay(seconds):next(function ()
		Network.set_max_transmit_rate(0.03)

		Managers.backend.title_request = title_request
		Managers.backend.url_request = url_request
		_is_disconnected = false
	end)
end

functions.disconnect = {
	width = 60,
	name = "Disconnect for x seconds.",
	num_decimals = 2,
	category = "Network",
	button_text = "Disconnect",
	number_button = true,
	on_activated = _disconnect
}

local function _special_breed_options()
	local num_special_breeds = 0
	local special_breed_names = {}
	local Breeds = require("scripts/settings/breed/breeds")

	for name, breed in pairs(Breeds) do
		if Breed.is_minion(breed) and breed.tags.special then
			num_special_breeds = num_special_breeds + 1
			special_breed_names[num_special_breeds] = name
		end
	end

	table.sort(special_breed_names)

	return special_breed_names
end

local function _try_spawn_special_minion(new_value, old_value)
	if Managers.state.pacing then
		Managers.state.pacing:try_inject_special(new_value)
	end
end

functions.try_spawn_special_minion = {
	name = "Try Spawn Special Minion",
	category = "Pacing",
	options_function = _special_breed_options,
	on_activated = _try_spawn_special_minion
}

local function hide_selected_unit()
	local selected_unit = Debug.selected_unit

	if not ALIVE[selected_unit] then
		return
	end

	Unit.set_unit_visibility(selected_unit, false, true)
end

functions.hide_selected_unit = {
	name = "Hide Selected Unit",
	category = "Unit",
	on_activated = hide_selected_unit
}

local function _current_equipment(slot_name)
	if not Debug.exists() then
		return "n/a"
	end

	local player_unit_spawn_manager = Managers.state.player_unit_spawn

	if player_unit_spawn_manager then
		local local_player = player_unit_spawn_manager:owner(Debug.selected_unit)

		if not local_player or local_player.remote then
			local_player = Managers.player:local_player(1)
		end

		local local_player_unit = local_player.player_unit

		if not local_player_unit then
			return "empty"
		else
			local inventory_component = ScriptUnit.extension(local_player_unit, "unit_data_system"):read_component("inventory")

			return inventory_component[slot_name] or "empty"
		end
	else
		return "n/a"
	end
end

local function _short_party_id(party_id)
	return string.sub(party_id, 1, 8)
end

local function _format_party_entry(party_entry)
	local short_party_id = _short_party_id(party_entry.party_id)

	return short_party_id .. " -> " .. tostring(#party_entry.members)
end

local function _format_party_entries(party_entries)
	local formatted = {}

	for i, party_entry in ipairs(party_entries) do
		if #party_entry.members < 4 then
			table.insert(formatted, _format_party_entry(party_entry))
		end
	end

	return formatted
end

if GameParameters.prod_like_backend then
	functions.immaterium_part_id = {
		readonly = true,
		name = "Party Id",
		category = "Immaterium (Party)",
		get_function = function ()
			return Managers.party_immaterium:party_id()
		end
	}
	functions.immaterium_debug_party_joiner = {
		name = "Party Joiner",
		category = "Immaterium (Party)",
		dynamic_contents = true,
		options_function = function ()
			return _format_party_entries(Managers.party_immaterium:cached_debug_get_parties())
		end,
		on_activated = function (selected_option)
			local short_party_id = _short_party_id(selected_option)

			for i, party in ipairs(Managers.party_immaterium:cached_debug_get_parties()) do
				if string.starts_with(party.party_id, short_party_id) then
					Managers.party_immaterium:join_party(party.party_id)

					return
				end
			end
		end
	}
	functions.immaterium_leave_party = {
		name = "Leave Party",
		category = "Immaterium (Party)",
		on_activated = function ()
			Managers.party_immaterium:leave_party()
		end
	}
end

local function _equip_slot_on_value_set_function(item_name, old_item_name, slot_name, item_data)
	local player_unit_spawn_manager = Managers.state.player_unit_spawn

	if not player_unit_spawn_manager then
		return
	end

	local local_player = player_unit_spawn_manager:owner(Debug.selected_unit)

	if not local_player or local_player.remote then
		local_player = Managers.player:local_player(1)
	end

	local is_server = Managers.state.game_session:is_server()
	local player_unit = local_player.player_unit
	local visual_loadout_extension = ScriptUnit.extension(player_unit, "visual_loadout_system")
	local inventory_component = ScriptUnit.extension(player_unit, "unit_data_system"):read_component("inventory")
	local previous_item = inventory_component[slot_name]
	local can_unequip = previous_item ~= visual_loadout_extension.UNEQUIPPED_SLOT

	if not can_unequip and not item_data then
		return
	end

	local profile = local_player:profile()
	local archetype = profile.archetype
	local archetype_name = archetype.name
	local breed_name = archetype.breed
	local breeds = item_data and item_data.breeds
	local breed_valid = not breeds or table.contains(breeds, breed_name)

	if not breed_valid then
		Log.info("DebugFunction", "Skipping equip of item %q due to non-compatible breed.", item_name)

		return
	end

	local archetypes = item_data and item_data.archetypes
	local archetype_valid = not archetypes or table.contains(archetypes, archetype_name)

	if not archetype_valid then
		Log.info("DebugFunction", "Skipping equip of item %q due to non-compatible archetype.", item_name)

		return
	end

	local character_id = local_player:character_id()
	local peer_id = local_player:peer_id()
	local local_player_id = local_player:local_player_id()

	if not local_player:has_placeholder_profile() then
		if item_data then
			Managers.backend.interfaces.characters:equip_item_slot_debug(character_id, slot_name, item_data.name):next(function (v)
				Log.debug("DebugFunctions", "Equipped!")

				if is_server then
					local profile_synchronizer_host = Managers.profile_synchronization:synchronizer_host()

					profile_synchronizer_host:profile_changed(peer_id, local_player_id)
				else
					Managers.connection:send_rpc_server("rpc_notify_profile_changed", peer_id, local_player_id)
				end
			end):catch(function (errors)
				Log.error("DebugFunctions", "Equipping %s to %s failed. You probably have Steam running togehter with a local character profile! %s", item_data.name, slot_name, errors)
			end)
		end
	elseif is_server then
		local profile_synchronizer_host = Managers.profile_synchronization:synchronizer_host()

		profile_synchronizer_host:override_slot(peer_id, local_player_id, slot_name, item_data.name)
	else
		local slot_name_id = NetworkLookup.player_inventory_slot_names[slot_name]
		local item_name_id = NetworkLookup.player_item_names[item_data.name]

		Managers.connection:send_rpc_server("rpc_notify_profile_changed_debug_item", peer_id, local_player_id, slot_name_id, item_name_id)
	end
end

local function _equip_gear_options_function(item_definitions, optional_first_entry)
	local player_items_gear_names = table.keys(item_definitions)

	table.sort(player_items_gear_names)

	if optional_first_entry then
		table.insert(player_items_gear_names, 1, optional_first_entry)
	end

	return player_items_gear_names
end

local function _equip_gear_on_value_set_function(item_name, old_item_name, slot_name, item_definitions)
	local item_data = item_definitions[item_name]

	_equip_slot_on_value_set_function(item_name, old_item_name, slot_name, item_data)
end

local function _generate_slot_item_definitions_lookup(player_items)
	local item_definitions_lookup = {}

	for item_name, item_data in pairs(player_items) do
		local slots = item_data.slots

		if slots then
			for j = 1, #slots do
				local slot_name = slots[j]
				local lookup = item_definitions_lookup[slot_name]

				if not lookup then
					lookup = {}
					item_definitions_lookup[slot_name] = lookup
				end

				lookup[item_name] = item_data
			end
		end
	end

	return item_definitions_lookup
end

local function _add_weapon_category(function_key, category, name, slot_name, definitions)
	functions[function_key] = {
		category = category,
		name = name,
		get_function = function ()
			return _current_equipment(slot_name)
		end,
		options_function = function ()
			return _equip_gear_options_function(definitions)
		end,
		on_activated = function (new_value, old_value)
			_equip_gear_on_value_set_function(new_value, old_value, slot_name, definitions)
		end
	}
end

local function _create_weapon_categories(item_definitions, data, slot_name)
	local shippable_definitions = {
		human = {},
		ogryn = {}
	}
	local functional_definitions = {
		human = {},
		ogryn = {}
	}
	local blockout_definitions = {
		human = {},
		ogryn = {}
	}
	local prototype_definitions = {
		human = {},
		ogryn = {}
	}

	for name, item in pairs(item_definitions) do
		repeat
			local slots = item.slots

			if not slots then
				break
			end

			local slot_valid = table.contains(slots, slot_name)

			if not slot_valid then
				break
			end

			local breeds = item.breeds

			if not breeds then
				break
			end

			local archetypes = item.archetypes
			local archetype_valid = not archetypes or archetypes and not table.contains(archetypes, "npc")

			if not archetype_valid then
				break
			end

			local workflow_state = item.workflow_state
			local shippable = workflow_state == "SHIPPABLE" or workflow_state == "RELEASABLE"
			local functional = workflow_state == "FUNCTIONAL"
			local prototype = workflow_state == "PROTOTYPE"
			local blockout = workflow_state == "BLOCKOUT"

			if shippable then
				for j = 1, #breeds do
					shippable_definitions[breeds[j]][name] = item
				end
			elseif functional then
				for j = 1, #breeds do
					functional_definitions[breeds[j]][name] = item
				end
			elseif prototype then
				for j = 1, #breeds do
					prototype_definitions[breeds[j]][name] = item
				end
			elseif blockout then
				for j = 1, #breeds do
					blockout_definitions[breeds[j]][name] = item
				end
			end
		until true
	end

	_add_weapon_category("equip_shippable_" .. slot_name .. "_human", WEAPON_CATEGORY .. SHIPPABLE_DESCRIPTION, slot_name .. ", human (SHIPPABLE)", slot_name, shippable_definitions.human)
	_add_weapon_category("equip_functional_" .. slot_name .. "_human", WEAPON_CATEGORY .. FUNCTIONAL_DESCRIPTION, slot_name .. ", human (FUNCTIONAL)", slot_name, functional_definitions.human)
	_add_weapon_category("equip_prototype_" .. slot_name .. "_human", WEAPON_CATEGORY .. PROTOTYPE_DESCRIPTION, slot_name .. ", human (PROTOTYPE)", slot_name, prototype_definitions.human)
	_add_weapon_category("equip_blockout_" .. slot_name .. "_human", WEAPON_CATEGORY .. BLOCKOUT_DESCRIPTION, slot_name .. ", human (BLOCKOUT)", slot_name, blockout_definitions.human)
	_add_weapon_category("equip_shippable_" .. slot_name .. "_ogryn", WEAPON_CATEGORY .. SHIPPABLE_DESCRIPTION, slot_name .. ", ogryn (SHIPPABLE)", slot_name, shippable_definitions.ogryn)
	_add_weapon_category("equip_functional_" .. slot_name .. "_ogryn", WEAPON_CATEGORY .. FUNCTIONAL_DESCRIPTION, slot_name .. ", ogryn (FUNCTIONAL)", slot_name, functional_definitions.ogryn)
	_add_weapon_category("equip_prototype_" .. slot_name .. "_ogryn", WEAPON_CATEGORY .. PROTOTYPE_DESCRIPTION, slot_name .. ", ogryn (PROTOTYPE)", slot_name, prototype_definitions.ogryn)
	_add_weapon_category("equip_blockout_" .. slot_name .. "_ogryn", WEAPON_CATEGORY .. BLOCKOUT_DESCRIPTION, slot_name .. ", ogryn (BLOCKOUT)", slot_name, blockout_definitions.ogryn)
end

local function _equip_emote_on_value_set_function(item_name, slot_name)
	local player_unit_spawn_manager = Managers.state.player_unit_spawn

	if not player_unit_spawn_manager then
		return
	end

	local local_player = Managers.player:local_player(1)
	local is_server = Managers.state.game_session:is_server()
	local character_id = local_player:character_id()
	local peer_id = local_player:peer_id()
	local local_player_id = local_player:local_player_id()

	if not local_player:has_placeholder_profile() then
		Managers.backend.interfaces.characters:equip_item_slot_debug(character_id, slot_name, item_name):next(function (v)
			Log.debug("DebugFunctions", "Equipped Empote %s", item_name)

			if is_server then
				local profile_synchronizer_host = Managers.profile_synchronization:synchronizer_host()

				profile_synchronizer_host:profile_changed(peer_id, local_player_id)
			else
				Managers.connection:send_rpc_server("rpc_notify_profile_changed", peer_id, local_player_id)
			end
		end):catch(function (errors)
			Log.error("DebugFunctions", "Equipping %s to %s failed. You probably have Steam running togehter with a local character profile! %s", item_name, slot_name, errors)
		end)
	elseif is_server then
		local profile_synchronizer_host = Managers.profile_synchronization:synchronizer_host()

		profile_synchronizer_host:override_slot(peer_id, local_player_id, slot_name, item_name)
	else
		local slot_name_id = NetworkLookup.player_inventory_slot_names[slot_name]
		local item_name_id = NetworkLookup.player_item_names[item_name]

		Managers.connection:send_rpc_server("rpc_notify_profile_changed_debug_item", peer_id, local_player_id, slot_name_id, item_name_id)
	end
end

local function _init_weapons(player_items)
	local slot_item_definitions_lookup = _generate_slot_item_definitions_lookup(player_items)

	for slot_name, data in pairs(PlayerCharacterConstants.slot_configuration) do
		local is_weapon = false
		local item_definitions, optional_first_entry, category = nil

		if data.wieldable and data.slot_type == "weapon" then
			item_definitions = slot_item_definitions_lookup[slot_name] or {}
			is_weapon = true
		elseif not data.wieldable then
			category = "Player Equipment - Gear"
			optional_first_entry = "none"
			item_definitions = slot_item_definitions_lookup[slot_name] or {}
		end

		if item_definitions then
			local pretty_name = slot_name

			if is_weapon then
				_create_weapon_categories(item_definitions or {}, data, slot_name)
			else
				functions["equip_" .. slot_name] = {
					category = category,
					name = pretty_name,
					get_function = function ()
						return _current_equipment(slot_name)
					end,
					options_function = function ()
						return _equip_gear_options_function(item_definitions, optional_first_entry)
					end,
					on_activated = function (new_value, old_value)
						_equip_gear_on_value_set_function(new_value, old_value, slot_name, item_definitions)
					end
				}
			end
		end
	end

	functions.equip_boon = {
		name = "Equip Boon",
		category = "Player Equipment - Boons",
		options_function = function ()
			local slot_name = "slot_boon"
			local item_definitions = slot_item_definitions_lookup[slot_name] or {}
			local optional_first_entry = nil

			if item_definitions then
				return _equip_gear_options_function(item_definitions, optional_first_entry)
			end
		end,
		on_activated = function (boon_name)
			Log.info("DebugFunctions", "Boon equipped %s", boon_name)

			local player_unit_spawn_manager = Managers.state.player_unit_spawn

			if not player_unit_spawn_manager then
				return
			end

			local local_player = player_unit_spawn_manager:owner(Debug.selected_unit)

			if not local_player or local_player.remote then
				local_player = Managers.player:local_player(1)
			end

			Managers.boons:debug_equip_boon(local_player, boon_name)
		end,
		get_function = function ()
			local player_unit_spawn_manager = Managers.state.player_unit_spawn

			if not player_unit_spawn_manager then
				return DebugSingleton.boon or "empty"
			end

			local local_player = Managers.player:local_player(1)

			if not local_player:unit_is_alive() then
				return DebugSingleton.boon or "empty"
			end

			local boon_item = Managers.boons:equipped_boon(local_player)

			if boon_item then
				local boon_item_name = boon_item.name

				return boon_item_name
			else
				return DebugSingleton.boon or "empty"
			end
		end
	}
	functions.equip_emote = {
		name = "Equip Emote",
		category = "Player Equipment - Emotes",
		dynamic_contents = true,
		options_function = function ()
			local options = {}
			local player_unit_spawn_manager = Managers.state.player_unit_spawn

			if not player_unit_spawn_manager then
				return options
			end

			local player = Managers.player:local_player(1)

			if not player:unit_is_alive() then
				return options
			end

			local slot_name = "slot_animation_emote_1"
			local item_definitions = slot_item_definitions_lookup[slot_name] or {}

			if not item_definitions then
				return options
			end

			local breed = player:breed_name()

			for id, item in pairs(item_definitions) do
				local breeds = item.breeds
				local can_use_emote = table.contains(breeds, breed)

				if can_use_emote then
					table.insert(options, id)
				end
			end

			table.sort(options)

			return options
		end,
		on_activated = function (master_item_id, prev_master_item_id)
			if not Managers.state.game_mode then
				return
			end

			local game_mode_name = Managers.state.game_mode:game_mode_name()
			local is_in_hub = game_mode_name == "hub"

			if not is_in_hub then
				return
			end

			local player_unit_spawn_manager = Managers.state.player_unit_spawn

			if not player_unit_spawn_manager then
				return
			end

			local player = Managers.player:local_player(1)
			local player_unit = player.player_unit

			if not player_unit then
				return
			end

			local item = MasterItems.get_item(master_item_id)
			local anim_event = item.animation_event
			local animation_extension = ScriptUnit.extension(player_unit, "animation_system")

			_equip_emote_on_value_set_function(master_item_id, "slot_animation_emote_1")
		end,
		get_function = function ()
			local player_unit_spawn_manager = Managers.state.player_unit_spawn

			if not player_unit_spawn_manager then
				return "empty"
			end

			local player = Managers.player:local_player(1)
			local profile = player:profile()
			local loadout = profile.loadout
			local emote_item = loadout.slot_animation_emote_1

			if not emote_item then
				return "empty"
			end

			local emote_item_name = emote_item.name

			return emote_item_name
		end
	}
end

local function _init_equipment(player_items)
	local function _load_equipment()
		local local_player = Managers.player:local_player(1)
		local local_player_unit = local_player.player_unit

		if not local_player_unit then
			return
		end

		local unit_data_extension = ScriptUnit.extension(local_player_unit, "unit_data_system")
		local breed_name = unit_data_extension:breed_name()
		local equipment_data = Application.user_setting("development_player_equipment", breed_name)

		if not equipment_data then
			Log.warning("DebugFunctions.load_equipment", "Couldn't find any stored equipment for %s.", breed_name)

			return
		end

		local visual_loadout_extension = ScriptUnit.extension(local_player_unit, "visual_loadout_system")
		local UNEQUIPPED_SLOT = visual_loadout_extension.UNEQUIPPED_SLOT
		local slot_configuration = visual_loadout_extension:slot_configuration()

		for slot_name, config in pairs(slot_configuration) do
			local item_name = equipment_data[slot_name]

			if item_name then
				if item_name == UNEQUIPPED_SLOT then
					_equip_slot_on_value_set_function(item_name, nil, slot_name, nil)
				else
					local item_data = rawget(player_items, item_name)

					if item_data then
						_equip_slot_on_value_set_function(item_name, nil, slot_name, item_data)
					else
						Log.warning("DebugFunctions.load_equipment", "Couldn't find item %s (%s) whilst loading equipment for %s - skipping.", item_name, slot_name, breed_name)
					end
				end
			end
		end

		Log.info("DebugFunctions.load_equipment", "Equipment loaded for %s.", breed_name)
	end

	local function _save_equipment()
		local local_player = Managers.player:local_player(1)
		local local_player_unit = local_player.player_unit

		if not local_player_unit then
			return
		end

		local unit_data_extension = ScriptUnit.extension(local_player_unit, "unit_data_system")
		local inventory_component = unit_data_extension:read_component("inventory")
		local equipment_data = {}
		local visual_loadout_extension = ScriptUnit.extension(local_player_unit, "visual_loadout_system")
		local slot_configuration = visual_loadout_extension:slot_configuration()

		for slot_name, config in pairs(slot_configuration) do
			if not config.wieldable or config.slot_type == "weapon" then
				local item_name = inventory_component[slot_name]
				equipment_data[slot_name] = item_name
			end
		end

		local breed_name = unit_data_extension:breed_name()

		Application.set_user_setting("development_player_equipment", breed_name, equipment_data)
		Application.save_user_settings()
		Log.info("DebugFunctions.save_equipment", "Equipment saved for %s.", breed_name)
	end

	functions.load_equipment = {
		name = "Load Equipment",
		category = "Player Equipment",
		on_activated = _load_equipment
	}
	functions.save_equipment = {
		name = "Save Equipment",
		category = "Player Equipment",
		on_activated = _save_equipment
	}
end

local function _gift_equipped()
	for slot_name, data in pairs(PlayerCharacterConstants.slot_configuration) do
		if data.slot_type == "gear" or data.slot_type == "weapon" then
			local item = _current_equipment(slot_name)

			if not string.ends_with(item, "_empty") and item ~= "not_equipped" then
				Log.info("DebugFunctions", "Gifting item %s", item)
				Managers.backend.interfaces.gear:create(item, slot_name, nil, nil, false):next(function (v)
					Log.info("DebugFunctions", " %s created", v.uuid)
				end)
			end
		end
	end
end

local function _clear_inventory(wrapped)
	if not wrapped then
		Log.info("DebugFunctions", "Clearing inventory")
		Managers.backend.interfaces.gear:fetch_paged(10):next(_clear_inventory)
	else
		local deletes = {}

		for k, v in pairs(wrapped.items) do
			if string.starts_with(v.uuid, "default") or string.starts_with(v.uuid, "cosmetic") then
				Log.info("DebugFunctions", "Skipping item %s", v.uuid)
			else
				Log.info("DebugFunctions", "Deleting item %s", v.uuid)
				table.insert(deletes, Managers.backend.interfaces.gear:delete_gear(v.uuid):next(function (_)
					Log.info("DebugFunctions", " %s deleted", v.uuid)
				end))
			end
		end

		if wrapped.has_next then
			Promise.all(unpack(deletes)):next(wrapped.next_page():next(_clear_inventory))
		end
	end
end

functions.clear_inventory = {
	name = "Clear Inventory",
	category = "Player Inventory",
	on_activated = _clear_inventory
}
functions.gift_equipped = {
	name = "Gift all equipped items",
	category = "Player Inventory",
	on_activated = _gift_equipped
}

local function _modify_ammo(amount)
	if amount == 0 then
		return
	end

	local local_player = Managers.player:local_player(1)

	if local_player:unit_is_alive() then
		local is_server = Managers.state.game_session:is_server()
		local local_player_unit = local_player.player_unit
		local game_object_id = Managers.state.unit_spawner:game_object_id(local_player_unit)

		if is_server then
			Debug:rpc_debug_client_request_modify_ammo(nil, game_object_id, amount)
		else
			Managers.state.game_session:send_rpc_server("rpc_debug_client_request_modify_ammo", game_object_id, amount)
		end
	end
end

functions.modify_ammo = {
	name = "Modify Ammo",
	category = "Player Equipment",
	width = 40,
	number_button = true,
	on_activated = _modify_ammo
}

local function _delete_characters(character_profiles)
	local character_ids = {}

	for _, character_profile in pairs(character_profiles) do
		local character_id = character_profile.character_id
		character_ids[#character_ids + 1] = character_id
	end

	Managers.event:trigger("event_request_delete_multiple_characters", character_ids)
end

local function _main_menu_view()
	local main_menu_view = ui_manager._view_handler._active_views_data.main_menu_view.instance

	return main_menu_view
end

local function _character_profiles()
	local main_menu_view = _main_menu_view()
	local character_profiles = main_menu_view._character_profiles

	return character_profiles
end

local function _delete_amount_of_characters(amount)
	local character_profiles = _character_profiles()
	local profiles_to_delete = table.move(character_profiles, 1, amount, 1, {})

	_delete_characters(profiles_to_delete)
end

local function _delete_all_characters()
	local character_profiles = _character_profiles()
	local amount = #character_profiles

	_delete_amount_of_characters(amount)
end

local function _delete_selected_character()
	local main_menu_view = _main_menu_view()
	local selected_character_index = main_menu_view._selected_character_list_index
	local selected_character_slot_widget = main_menu_view._character_list_widgets[selected_character_index]
	local selected_character_profile = selected_character_slot_widget.content.profile

	_delete_characters({
		selected_character_profile
	})
end

local function _is_main_menu_active()
	local active_view = ui_manager._view_handler:active_top_view()
	local is_main_menu_active = active_view == "main_menu_view"

	return is_main_menu_active
end

if DevParameters.disable_boon_activation_at_start_of_mission then
	functions.activate_boons = {
		name = "Activate Boons",
		category = "Player Equipment - Boons",
		on_activated = function ()
			Managers.boons:debug_activate_boons()
			Log.info("DebugFunctions", "ACTIVATE_BOONS!")
		end
	}
end

functions.play_emote_animation = {
	name = " ->",
	button_text = "Play Emote",
	category = "Player Equipment - Emotes",
	on_activated = function ()
		if not Managers.state.game_mode then
			Managers.event:trigger("event_add_notification_message", "dev", "Can only play Emotes in Hub")

			return
		end

		local game_mode_name = Managers.state.game_mode:game_mode_name()
		local is_in_hub = game_mode_name == "hub"

		if not is_in_hub then
			Managers.event:trigger("event_add_notification_message", "dev", "Can only play Emotes in Hub")

			return
		end

		Managers.event:trigger("player_activate_emote", "emote_1")
	end
}
functions.add_all_animation_items = {
	name = "Add All Emotes and EOR Animation Items to Inventory",
	button_text = "Add",
	category = "Player Equipment - Emotes",
	on_activated = function ()
		local player_unit_spawn_manager = Managers.state.player_unit_spawn

		if not player_unit_spawn_manager then
			return "empty"
		end

		local player = Managers.player:local_player(1)
		local character_id = player:character_id()

		if not character_id then
			return
		end

		local item_definitions = MasterItems.get_cached()

		for id, item in pairs(item_definitions) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-27, warpins: 2 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #0



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-30, warpins: 1 ---
			local item_type = item.item_type

			if not item_type then

				-- Decompilation error in this vicinity:
				--- BLOCK #2 31-31, warpins: 1 ---
				break
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #2 31-31, warpins: 1 ---
			break

			--- END OF BLOCK #2 ---




			-- Decompilation error in this vicinity:
			--- BLOCK #3 32-33, warpins: 1 ---
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #4 34-35, warpins: 1 ---
			--- END OF BLOCK #4 ---

			if item_type == "END_OF_ROUND" then
			JUMP TO BLOCK #5
			else
			JUMP TO BLOCK #6
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #5 36-61, warpins: 2 ---
			local item_name = item.name
			local slots = item.slots
			local slot_name = slots[1]
			local overrides = {}
			local DONT_ALLOW_DUPLICATES = false

			Managers.backend.interfaces.gear:create(item_name, slot_name, nil, overrides, DONT_ALLOW_DUPLICATES):next(function (v)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				local gear = v.gear
				local gear_id = gear.uuid

				Log.info("DebugFunctions", " %s created in inventory: %s", item_name, gear_id)

				return
				--- END OF BLOCK #0 ---



			end):catch(function (errors)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				Log.error("DebugFunctions", "Creating %s failed: %s", item_name, errors)

				return
				--- END OF BLOCK #0 ---



			end)

			break
			--- END OF BLOCK #5 ---




			-- Decompilation error in this vicinity:
			--- BLOCK #6 62-63, warpins: 1 ---
			--- END OF BLOCK #6 ---

			slot30001 = if true then
			JUMP TO BLOCK #7
			else
			JUMP TO BLOCK #0
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #7 64-65, warpins: 4 ---
			--- END OF BLOCK #7 ---



		end
	end
}
functions.delete_all_characters = {
	name = "Delete All Characters",
	category = "Player Profiles",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		local is_main_menu_active = _is_main_menu_active()

		--- END OF BLOCK #0 ---

		slot0 = if is_main_menu_active then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-7, warpins: 1 ---
		_delete_all_characters()
		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 8-12, warpins: 1 ---
		Log.info("DebugFunctions", "You can only delete characters while in the main menu!")

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end
}
functions.delete_characters = {
	name = "Delete Characters",
	number_button = true,
	category = "Player Profiles",
	on_activated = function (amount)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		local is_main_menu_active = _is_main_menu_active()

		--- END OF BLOCK #0 ---

		slot1 = if is_main_menu_active then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-8, warpins: 1 ---
		_delete_amount_of_characters(amount)
		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 9-13, warpins: 1 ---
		Log.info("DebugFunctions", "You can only delete characters while in the main menu!")

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 14-14, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end
}
functions.delete_selected_character = {
	name = "Delete Selected Character",
	category = "Player Profiles",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		local is_main_menu_active = _is_main_menu_active()

		--- END OF BLOCK #0 ---

		slot0 = if is_main_menu_active then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-7, warpins: 1 ---
		_delete_selected_character()
		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 8-12, warpins: 1 ---
		Log.info("DebugFunctions", "You can only delete characters while in the main menu!")

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end
}

local function _select_player_voice(selected_voice)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	local local_player = Managers.player:local_player(1)
	local local_player_id = local_player:local_player_id()
	local local_player_unit = local_player.player_unit
	local is_server = Managers.state.game_session:is_server()
	local voice_id = NetworkLookup.player_character_voices[selected_voice]
	local game_object_id = Managers.state.unit_spawner:game_object_id(local_player_unit)
	--- END OF BLOCK #0 ---

	slot4 = if is_server then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 29-54, warpins: 1 ---
	local profile = local_player:profile()
	profile.selected_voice = selected_voice
	local peer_id = local_player:peer_id()
	local profile_synchronizer_host = Managers.profile_loading:synchronizer_host()

	profile_synchronizer_host:set_player_profile(peer_id, local_player_id, profile)

	local function callback()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		Managers.state.game_session:send_rpc_clients("rpc_player_select_voice", game_object_id, voice_id)

		local dialogue_extension = ScriptUnit.extension(local_player_unit, "dialogue_system")

		dialogue_extension:set_vo_profile(selected_voice)

		return
		--- END OF BLOCK #0 ---



	end

	profile_synchronizer_host:do_when_synced(peer_id, callback, "selected_voice")
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 55-72, warpins: 1 ---
	Managers.state.game_session:send_rpc_server("rpc_player_select_voice_server", game_object_id, voice_id)

	local dialogue_extension = ScriptUnit.extension(local_player_unit, "dialogue_system")

	dialogue_extension:set_vo_profile(selected_voice)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 73-74, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

local DialogueBreedSettings = require("scripts/settings/dialogue/dialogue_breed_settings")
functions.select_player_voice = {
	name = "Select Player Voice",
	category = "Player Voice",
	options_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		local voices = DialogueBreedSettings.human.wwise_voices

		return voices
		--- END OF BLOCK #0 ---



	end,
	on_activated = function (new_value, old_value)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		_select_player_voice(new_value)

		return
		--- END OF BLOCK #0 ---



	end
}
functions.report_error = {
	name = "Report Error",
	category = "Error",
	options_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		local level_names = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-10, warpins: 0 ---
		for name, level in pairs(Managers.error.ERROR_LEVEL) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-8, warpins: 1 ---
			level_names[level] = name
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-10, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 11-11, warpins: 1 ---
		return level_names
		--- END OF BLOCK #2 ---



	end,
	on_activated = function (level_name)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		local test_error_class = require("scripts/managers/error/errors/test_error")
		local error_obj = test_error_class:new(level_name)

		Managers.error:report_error(error_obj)

		return
		--- END OF BLOCK #0 ---



	end
}
functions.complete_game_mode = {
	name = "Complete Game Mode",
	category = "Game Mode",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		local outcome = "won"
		local is_server = Managers.state.game_session:is_server()

		--- END OF BLOCK #0 ---

		slot1 = if is_server then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-17, warpins: 1 ---
		Managers.state.game_mode:debug_complete_game_mode(outcome)

		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 18-28, warpins: 1 ---
		local outcome_id = NetworkLookup.game_mode_outcomes[outcome]

		Managers.state.game_session:send_rpc_server("rpc_debug_client_request_complete_game_mode", outcome_id)

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 29-29, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end
}
functions.fail_game_mode = {
	name = "Fail Game Mode",
	category = "Game Mode",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		local outcome = "lost"
		local is_server = Managers.state.game_session:is_server()

		--- END OF BLOCK #0 ---

		slot1 = if is_server then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-17, warpins: 1 ---
		Managers.state.game_mode:debug_complete_game_mode(outcome)

		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 18-28, warpins: 1 ---
		local outcome_id = NetworkLookup.game_mode_outcomes[outcome]

		Managers.state.game_session:send_rpc_server("rpc_debug_client_request_complete_game_mode", outcome_id)

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 29-29, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end
}
functions.force_respawn = {
	name = "Force Respawn All Players",
	category = "Game Mode",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		local is_server = Managers.state.game_session:is_server()

		--- END OF BLOCK #0 ---

		slot0 = if is_server then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-15, warpins: 1 ---
		Managers.state.game_mode:debug_force_respawn()
		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 16-22, warpins: 1 ---
		Managers.state.game_session:send_rpc_server("rpc_debug_client_request_force_respawn")

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 23-23, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end
}
functions.debug_stagger_selected_unit = {
	name = "Stagger (DevParams)",
	button_text = "Trigger",
	category = "Stagger",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		local selected_unit = Debug.selected_unit
		--- END OF BLOCK #0 ---

		slot0 = if selected_unit then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-10, warpins: 1 ---
		local Stagger = require("scripts/utilities/attack/stagger")

		Stagger.debug_trigger_minion_stagger(selected_unit)

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end
}
functions.debug_stagger_selected_unit_with_animation = {
	name = "Stagger With Animation (DevParams)",
	category = "Stagger",
	dynamic_contents = true,
	on_activated = function (stagger_animation)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		local selected_unit = Debug.selected_unit
		--- END OF BLOCK #0 ---

		slot1 = if selected_unit then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-13, warpins: 1 ---
		local Stagger = require("scripts/utilities/attack/stagger")
		local stagger_direction = nil

		Stagger.debug_trigger_minion_stagger(selected_unit, stagger_direction, stagger_animation)

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-14, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end,
	options_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		local options = {}

		--- END OF BLOCK #0 ---

		slot1 = if Debug:exists()

		 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 1 ---
		local selected_unit = Debug.selected_unit
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 10-11, warpins: 2 ---
		--- END OF BLOCK #2 ---

		slot1 = if selected_unit then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #18
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 12-15, warpins: 1 ---
		--- END OF BLOCK #3 ---

		slot2 = if ALIVE[selected_unit] then
		JUMP TO BLOCK #4
		else
		JUMP TO BLOCK #18
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #4 16-23, warpins: 1 ---
		local is_server = Managers.state.game_session:is_server()

		--- END OF BLOCK #4 ---

		slot2 = if not is_server then
		JUMP TO BLOCK #5
		else
		JUMP TO BLOCK #6
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #5 24-24, warpins: 1 ---
		return options

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 25-31, warpins: 2 ---
		local unit_data_extension = ScriptUnit.has_extension(selected_unit, "unit_data_system")

		--- END OF BLOCK #6 ---

		slot3 = if not unit_data_extension then
		JUMP TO BLOCK #7
		else
		JUMP TO BLOCK #8
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #7 32-32, warpins: 1 ---
		return options

		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #8 33-41, warpins: 2 ---
		local breed = unit_data_extension:breed()

		--- END OF BLOCK #8 ---

		slot5 = if Breed.is_player(breed)

		 then
		JUMP TO BLOCK #9
		else
		JUMP TO BLOCK #10
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #9 42-42, warpins: 1 ---
		return options

		--- END OF BLOCK #9 ---

		FLOW; TARGET BLOCK #10



		-- Decompilation error in this vicinity:
		--- BLOCK #10 43-49, warpins: 2 ---
		local behavior_extension = ScriptUnit.has_extension(selected_unit, "behavior_system")

		--- END OF BLOCK #10 ---

		slot5 = if not behavior_extension then
		JUMP TO BLOCK #11
		else
		JUMP TO BLOCK #12
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #11 50-50, warpins: 1 ---
		return options

		--- END OF BLOCK #11 ---

		FLOW; TARGET BLOCK #12



		-- Decompilation error in this vicinity:
		--- BLOCK #12 51-62, warpins: 2 ---
		local brain = behavior_extension:brain()
		local behavior_tree = brain:behavior_tree()
		local action_data = behavior_tree:action_data()
		local stagger_action_data = action_data.stagger
		--- END OF BLOCK #12 ---

		slot9 = if stagger_action_data then
		JUMP TO BLOCK #13
		else
		JUMP TO BLOCK #17
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #13 63-68, warpins: 1 ---
		local stagger_type = DevParameters.debug_stagger_type
		local action_stagger_anims = stagger_action_data.stagger_anims
		local stagger_type_anims = action_stagger_anims[stagger_type]
		--- END OF BLOCK #13 ---

		slot12 = if stagger_type_anims then
		JUMP TO BLOCK #14
		else
		JUMP TO BLOCK #17
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #14 69-73, warpins: 1 ---
		local stagger_direction = DevParameters.debug_stagger_direction
		local stagger_direction_anims = stagger_type_anims[stagger_direction]

		--- END OF BLOCK #14 ---

		slot14 = if stagger_direction_anims then
		JUMP TO BLOCK #15
		else
		JUMP TO BLOCK #17
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #15 74-77, warpins: 1 ---
		--- END OF BLOCK #15 ---

		FLOW; TARGET BLOCK #16



		-- Decompilation error in this vicinity:
		--- BLOCK #16 78-84, warpins: 0 ---
		for _, animation in pairs(stagger_direction_anims) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 78-82, warpins: 1 ---
			table.insert(options, animation)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 83-84, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #16 ---

		FLOW; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #17 85-88, warpins: 4 ---
		table.sort(options)

		--- END OF BLOCK #17 ---

		FLOW; TARGET BLOCK #18



		-- Decompilation error in this vicinity:
		--- BLOCK #18 89-89, warpins: 3 ---
		return options
		--- END OF BLOCK #18 ---



	end
}

local function actions_options()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	local WeaponTemplates = require("scripts/settings/equipment/weapon_templates/weapon_templates")
	local weapon_template = WeaponTemplates[DevParameters.sweep_spline_selected_weapon_template]
	local options = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-19, warpins: 0 ---
	for name, action_settings in pairs(weapon_template.actions) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		--- END OF BLOCK #0 ---

		if action_settings.kind == "sweep" then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-17, warpins: 1 ---
		options[#options + 1] = name
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 18-19, warpins: 3 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-20, warpins: 1 ---
	return options
	--- END OF BLOCK #2 ---



end

local function run_sweep_spline_editor(new_value, old_value)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	local local_player = Managers.player:local_player(1)

	--- END OF BLOCK #0 ---

	slot3 = if local_player:unit_is_alive()

	 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-27, warpins: 1 ---
	local player_unit = local_player.player_unit
	local weapon_template_name = DevParameters.sweep_spline_selected_weapon_template
	local weapon_system = Managers.state.extension:system("weapon_system")

	weapon_system:debug_run_sweep_editor(player_unit, weapon_template_name, new_value)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-28, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

functions.sweep_spline_editor = {
	name = "Start Sweep Spline Editor",
	category = "Sweep Spline",
	options_function = actions_options,
	on_activated = run_sweep_spline_editor
}
functions.reset_time_scale = {
	name = "Reset Time Scale",
	category = "Time",
	on_activated = function (new_value, old_value)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		Debug:reset_time_scale()

		return
		--- END OF BLOCK #0 ---



	end
}

local function _sleep(seconds)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	Application.sleep(1000 * seconds)

	return
	--- END OF BLOCK #0 ---



end

functions.sleep = {
	width = 60,
	name = "Sleep for x seconds.",
	num_decimals = 2,
	category = "Time",
	button_text = "Sleep",
	number_button = true,
	on_activated = _sleep
}

local function _reset_dev_parameters()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	local ParameterResolver = require("scripts/foundation/utilities/parameters/parameter_resolver")

	ParameterResolver.reset_defaults()
	Application.set_user_setting("development_settings", DevParameters)
	Application.save_user_settings()

	return
	--- END OF BLOCK #0 ---



end

functions.reset_dev_parameters = {
	name = "Reset Dev Parameters",
	category = "Dev Parameters",
	on_activated = _reset_dev_parameters
}

local function _params_to_string(actual, defaults)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	local params_as_strings = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-75, warpins: 0 ---
	for name, default_value in pairs(defaults) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-12, warpins: 1 ---
		local value = actual[name]

		--- END OF BLOCK #1 ---

		if type(value)

		 ~= "table" then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 13-14, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #2 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #3 15-15, warpins: 1 ---
		local should_skip = true

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 16-17, warpins: 2 ---
		--- END OF BLOCK #4 ---

		slot9 = if should_skip then
		JUMP TO BLOCK #5
		else
		JUMP TO BLOCK #6
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #5 18-18, warpins: 1 ---
		--- END OF BLOCK #5 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #6 19-23, warpins: 1 ---
		--- END OF BLOCK #6 ---

		if type(default_value)

		 == "table" then
		JUMP TO BLOCK #7
		else
		JUMP TO BLOCK #9
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #7 24-26, warpins: 1 ---
		--- END OF BLOCK #7 ---

		if default_value.value ~= nil then
		JUMP TO BLOCK #8
		else
		JUMP TO BLOCK #9
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #8 27-27, warpins: 1 ---
		default_value = default_value.value
		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 28-29, warpins: 3 ---
		--- END OF BLOCK #9 ---

		if value ~= default_value then
		JUMP TO BLOCK #10
		else
		JUMP TO BLOCK #16
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #10 30-31, warpins: 1 ---
		--- END OF BLOCK #10 ---

		if value == true then
		JUMP TO BLOCK #11
		else
		JUMP TO BLOCK #12
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #11 32-40, warpins: 1 ---
		params_as_strings[#params_as_strings + 1] = string.format("-%s", name)

		--- END OF BLOCK #11 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #16



		-- Decompilation error in this vicinity:
		--- BLOCK #12 41-45, warpins: 1 ---
		--- END OF BLOCK #12 ---

		if type(value)
		 == "string" then
		JUMP TO BLOCK #13
		else
		JUMP TO BLOCK #15
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #13 46-52, warpins: 1 ---
		--- END OF BLOCK #13 ---

		if string.find(value, " ")

		 ~= nil then
		JUMP TO BLOCK #14
		else
		JUMP TO BLOCK #15
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #14 53-62, warpins: 1 ---
		params_as_strings[#params_as_strings + 1] = string.format("-%s \"%s\"", name, value)
		--- END OF BLOCK #14 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #16



		-- Decompilation error in this vicinity:
		--- BLOCK #15 63-71, warpins: 2 ---
		params_as_strings[#params_as_strings + 1] = string.format("-%s %s", name, value)
		--- END OF BLOCK #15 ---

		FLOW; TARGET BLOCK #16



		-- Decompilation error in this vicinity:
		--- BLOCK #16 72-73, warpins: 4 ---
		--- END OF BLOCK #16 ---

		slot30001 = if true then
		JUMP TO BLOCK #17
		else
		JUMP TO BLOCK #0
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #17 74-75, warpins: 3 ---
		--- END OF BLOCK #17 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 76-80, warpins: 1 ---
	return table.concat(params_as_strings, " ")
	--- END OF BLOCK #2 ---



end

local function _copy_parameters()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	local game_params = _params_to_string(GameParameters, require("scripts/foundation/utilities/parameters/default_game_parameters"))
	local dev_params = _params_to_string(DevParameters, require("scripts/foundation/utilities/parameters/default_dev_parameters").parameters)
	local all_strings = {}
	--- END OF BLOCK #0 ---

	if #game_params > 0 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-25, warpins: 1 ---
	all_strings[#all_strings + 1] = "-game"
	all_strings[#all_strings + 1] = game_params
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 26-29, warpins: 2 ---
	--- END OF BLOCK #2 ---

	if #dev_params > 0 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 30-36, warpins: 1 ---
	all_strings[#all_strings + 1] = "-dev"
	all_strings[#all_strings + 1] = dev_params
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 37-47, warpins: 2 ---
	local concat_string = table.concat(all_strings, " ")

	--- END OF BLOCK #4 ---

	slot4 = if not Clipboard.put(concat_string)
	 then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 48-52, warpins: 1 ---
	Log.warning("DebugFunctions", "Failed to copy string to clipboard.")

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 53-53, warpins: 2 ---
	return
	--- END OF BLOCK #6 ---



end

functions.copy_parameters = {
	name = "Copy Parameters",
	category = "Dev Parameters",
	on_activated = _copy_parameters
}

local function _next_level()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	local local_player = Managers.player:local_player(1)
	local profile = local_player:profile()
	--- END OF BLOCK #0 ---

	slot1 = if profile then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-17, warpins: 1 ---
	local character_id = local_player:character_id()
	local current_level = profile.current_level

	--- END OF BLOCK #1 ---

	slot2 = if character_id then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-42, warpins: 1 ---
	Managers.backend.interfaces.progression:get_progression("character", character_id):next(function (character_progression)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		local needed_xp_for_next_level = character_progression.neededXpForNextLevel

		--- END OF BLOCK #0 ---

		if needed_xp_for_next_level ~= 0 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-5, warpins: 1 ---
		--- END OF BLOCK #1 ---

		if needed_xp_for_next_level == -1 then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 6-9, warpins: 2 ---
		return Promise.resolved(true)

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 10-21, warpins: 2 ---
		local current_xp = character_progression.currentXp
		local new_xp = current_xp + needed_xp_for_next_level
		local promise = Managers.backend.interfaces.progression:set_character_xp(character_id, new_xp)

		return promise
		--- END OF BLOCK #3 ---



	end):next(function (data)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		local next_level = current_level + 1
		local promise = Managers.backend.interfaces.progression:level_up_character(character_id, next_level)

		return promise
		--- END OF BLOCK #0 ---



	end):next(function (data)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		local new_level = data.progressionInfo.currentLevel
		local new_xp = data.progressionInfo.currentXp

		Log.info("DebugFunctions", "Player level bumped to: %s, Player xp bumped to %s", new_level, new_xp)

		profile.current_level = new_level

		return
		--- END OF BLOCK #0 ---



	end):catch(function (error)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		Log.info("DebugFunctions", "Bumping player level failed, %s", error)

		return
		--- END OF BLOCK #0 ---



	end)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 43-43, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 44-45, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

functions.level_up = {
	name = "Level Up Character",
	button_text = "Level Up",
	category = "Progression",
	on_activated = _next_level
}

local function _set_xp(value)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	local local_player = Managers.player:local_player(1)
	local profile = local_player:profile()
	--- END OF BLOCK #0 ---

	slot2 = if profile then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-16, warpins: 1 ---
	local character_id = local_player:character_id()
	--- END OF BLOCK #1 ---

	slot3 = if character_id then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-33, warpins: 1 ---
	local promise = Managers.backend.interfaces.progression:set_character_xp(character_id, value)

	promise:next(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		Log.info("DebugFunctions", "XP set to: %d", value)

		return
		--- END OF BLOCK #0 ---



	end):catch(function (error)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		Log.info("DebugFunctions", "Adding character XP failed, %s", error)

		return
		--- END OF BLOCK #0 ---



	end)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-35, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

functions.set_xp = {
	name = "Set XP of Character",
	category = "Progression",
	button_text = "Set XP",
	number_button = true,
	on_activated = _set_xp
}

local function _reset_achievements()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	local local_player = Managers.player:local_player(1)
	local profile = local_player:profile()
	--- END OF BLOCK #0 ---

	slot1 = if profile then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-19, warpins: 1 ---
	local account_id = local_player:account_id()

	--- END OF BLOCK #1 ---

	if type(account_id)
	 == "string" then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-35, warpins: 1 ---
	Managers.backend.interfaces.commendations:delete_commendations(account_id):next(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		Log.info("DebugFunctions", "Sucessfully deleted achievements data")

		return
		--- END OF BLOCK #0 ---



	end):catch(function (error)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		Log.info("DebugFunctions", "Deleting achievements failed, %s", error)

		return
		--- END OF BLOCK #0 ---



	end)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 36-36, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

functions.reset_achievements = {
	name = "Delete all Achievement Data",
	button_text = "Delete Achievements",
	category = "Achievements",
	on_activated = _reset_achievements
}

local function _list_backend_achievements()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	local local_player = Managers.player:local_player(1)
	local profile = local_player:profile()
	--- END OF BLOCK #0 ---

	slot1 = if profile then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-19, warpins: 1 ---
	local account_id = local_player:account_id()

	--- END OF BLOCK #1 ---

	if type(account_id)
	 == "string" then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-37, warpins: 1 ---
	Managers.backend.interfaces.commendations:get_commendations(account_id, true, true):next(function (data)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		Log.info("DebugFunctions", "Successfully fetched achievements data %s", table.tostring(data, 5))

		return
		--- END OF BLOCK #0 ---



	end):catch(function (error)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		Log.info("DebugFunctions", "Fetching achievements failed, %s", error)

		return
		--- END OF BLOCK #0 ---



	end)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-38, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

functions.list_backend_achievements = {
	name = "List all Backend Achievements",
	button_text = "List Backend Achievements",
	category = "Achievements",
	on_activated = _list_backend_achievements
}

local function _list_achievement_definitions()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	local achievement_definitions = Managers.achievements:get_achievement_definitions()
	local readable = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-28, warpins: 0 ---
	for _, achievement_definition in ipairs(achievement_definitions) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-26, warpins: 1 ---
		readable[#readable + 1] = {
			id = achievement_definition:id(),
			label = achievement_definition:label(),
			description = achievement_definition:description()
		}
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-28, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-39, warpins: 1 ---
	Log.info("DebugFunction", "Achievements : %s", table.tostring(readable, 99))

	return
	--- END OF BLOCK #2 ---



end

functions.list_achievement_definitions = {
	name = "List all achievements",
	button_text = "List Achievements",
	category = "Achievements",
	on_activated = _list_achievement_definitions
}

local function _verify_achievements()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	Managers.achievements:verify_achievements()

	return
	--- END OF BLOCK #0 ---



end

functions.verify_achievements = {
	name = "Verify integrity of Achievements",
	button_text = "Verify Achievements",
	category = "Achievements",
	on_activated = _verify_achievements
}
local Views = require("scripts/ui/views/views")

local function _ui_manager_not_initialized()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	Log.warning("DebugFunctions", "The UI Manager has not been initialized")

	return
	--- END OF BLOCK #0 ---



end

local function _get_all_active_views()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot0 = if ui_manager then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-8, warpins: 1 ---
	return ui_manager._view_handler._active_views_array

	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-10, warpins: 1 ---
	_ui_manager_not_initialized()

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-11, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

local function _get_all_view_names()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	local filtered_views = {}
	local i = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-19, warpins: 0 ---
	for view_name, view in pairs(Views) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-9, warpins: 1 ---
		local testify_flags = view.testify_flags
		--- END OF BLOCK #0 ---

		if testify_flags ~= nil then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-12, warpins: 1 ---
		--- END OF BLOCK #1 ---

		if testify_flags.ui_views ~= nil then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 13-15, warpins: 1 ---
		--- END OF BLOCK #2 ---

		slot8 = if testify_flags.ui_views then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 16-17, warpins: 3 ---
		filtered_views[i] = view_name
		i = i + 1
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 18-19, warpins: 3 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-20, warpins: 1 ---
	return filtered_views
	--- END OF BLOCK #2 ---



end

functions.close_all_views = {
	name = "Close All Views",
	category = "UI",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot0 = if ui_manager then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-8, warpins: 1 ---
		ui_manager:close_all_views()
		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 9-10, warpins: 1 ---
		_ui_manager_not_initialized()

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end
}
functions.close_view = {
	name = "Close View",
	category = "UI",
	dynamic_contents = true,
	options_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		return _get_all_active_views()
		--- END OF BLOCK #0 ---



	end,
	on_activated = function (view_name)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot1 = if ui_manager then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-9, warpins: 1 ---
		ui_manager:close_view(view_name)
		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 10-11, warpins: 1 ---
		_ui_manager_not_initialized()

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 12-12, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end
}
functions.open_view = {
	name = "Open View",
	category = "UI",
	options_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		return _get_all_view_names()
		--- END OF BLOCK #0 ---



	end,
	on_activated = function (view_name)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot1 = if ui_manager then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #6
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-10, warpins: 1 ---
		local is_view_active = ui_manager:view_active(view_name)
		--- END OF BLOCK #1 ---

		slot1 = if not is_view_active then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #5
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 11-15, warpins: 1 ---
		--- END OF BLOCK #2 ---

		slot2 = if not Views[view_name].dummy_data then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 16-16, warpins: 1 ---
		local context = {
			debug_preview = true,
			can_exit = true
		}

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 17-24, warpins: 2 ---
		ui_manager:open_view(view_name, nil, nil, nil, nil, context)
		--- END OF BLOCK #4 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #5 25-33, warpins: 1 ---
		Log.warning("DebugFunctions", "View with name " .. view_name .. " is already active.")
		--- END OF BLOCK #5 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #6 34-35, warpins: 1 ---
		_ui_manager_not_initialized()

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 36-36, warpins: 3 ---
		return
		--- END OF BLOCK #7 ---



	end
}
local selected_voice, selected_sound_event_type, selected_sound_event, player_manager = nil

local function _dialogue_extension()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	local player = player_manager:local_player(1)

	--- END OF BLOCK #0 ---

	if player ~= nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-10, warpins: 1 ---
	--- END OF BLOCK #1 ---

	if player.player_unit == nil then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-11, warpins: 2 ---
	return

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 12-17, warpins: 2 ---
	local dialogue_extension = ScriptUnit.extension(player.player_unit, "dialogue_system")

	return dialogue_extension
	--- END OF BLOCK #3 ---



end

local function _select_voice(voice)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	selected_voice = voice
	selected_sound_event_type = nil
	selected_sound_event = nil
	local dialogue_extension = _dialogue_extension()
	--- END OF BLOCK #0 ---

	slot1 = if dialogue_extension then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-18, warpins: 1 ---
	local old_vo_profile = dialogue_extension:get_profile_name()

	dialogue_extension:set_vo_profile(voice)
	dialogue_extension:set_vo_profile(old_vo_profile)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

local EMPTY_TABLE = {}

local function _sound_event_types()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot0 = if selected_voice then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-7, warpins: 1 ---
	local dialogue_extension = _dialogue_extension()

	--- END OF BLOCK #1 ---

	if dialogue_extension == nil then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 1 ---
	return EMPTY_TABLE

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-19, warpins: 2 ---
	local vo_sources = dialogue_extension._vo_sources_cache._vo_sources
	local sound_event_types = vo_sources[selected_voice]
	local sound_event_type_names = table.keys(sound_event_types)

	return sound_event_type_names
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 20-21, warpins: 1 ---
	return EMPTY_TABLE
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 22-22, warpins: 2 ---
	return
	--- END OF BLOCK #5 ---



end

local function _sound_events()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot0 = if selected_sound_event_type then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-7, warpins: 1 ---
	local dialogue_extension = _dialogue_extension()

	--- END OF BLOCK #1 ---

	if dialogue_extension == nil then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 1 ---
	return EMPTY_TABLE

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-18, warpins: 2 ---
	local vo_sources = dialogue_extension._vo_sources_cache._vo_sources
	local sound_event_types = vo_sources[selected_voice]
	local sound_event_type = sound_event_types[selected_sound_event_type]
	local sound_events = sound_event_type.sound_events

	return sound_events
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 19-20, warpins: 1 ---
	return EMPTY_TABLE
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 21-21, warpins: 2 ---
	return
	--- END OF BLOCK #5 ---



end

local function _play_selected_sound_event()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	local dialogue_extension = _dialogue_extension()
	--- END OF BLOCK #0 ---

	slot1 = if selected_sound_event then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 1 ---
	--- END OF BLOCK #1 ---

	slot0 = if dialogue_extension then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-27, warpins: 1 ---
	local wwise_route = dialogue_extension._dialogue_system._wwise_route_default
	local event_type = "vorbis_external"
	local sound_event = {}
	sound_event.type = event_type
	sound_event.wwise_route = wwise_route
	sound_event.sound_event = selected_sound_event

	dialogue_extension:play_event(sound_event)
	Log.info("DebugFunctions", "Played sound event: " .. selected_sound_event)
	--- END OF BLOCK #2 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-32, warpins: 2 ---
	Log.info("DebugFunctions", "You need to select a sound event to be able to play one!")

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 33-33, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

functions.select_voice = {
	name = "01. Select Voice",
	category = "VO",
	get_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot0 = if not selected_voice then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-4, warpins: 1 ---
		slot0 = ""

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 5-5, warpins: 2 ---
		return slot0
		--- END OF BLOCK #2 ---



	end,
	options_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		local voices = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-28, warpins: 0 ---
		for _, breed in pairs(DialogueBreedSettings) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-10, warpins: 1 ---
			--- END OF BLOCK #0 ---

			if type(breed)

			 == "table" then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #2
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-12, warpins: 1 ---
			slot6 = breed.wwise_voices
			--- END OF BLOCK #1 ---

			UNCONDITIONAL JUMP; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #2 13-14, warpins: 1 ---
			slot6 = false
			--- END OF BLOCK #2 ---

			UNCONDITIONAL JUMP; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #3 15-15, warpins: 0 ---
			local wwise_voices = true

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 16-17, warpins: 3 ---
			--- END OF BLOCK #4 ---

			slot6 = if wwise_voices then
			JUMP TO BLOCK #5
			else
			JUMP TO BLOCK #7
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #5 18-21, warpins: 1 ---
			--- END OF BLOCK #5 ---

			FLOW; TARGET BLOCK #6



			-- Decompilation error in this vicinity:
			--- BLOCK #6 22-26, warpins: 0 ---
			for i = 1, #wwise_voices do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-26, warpins: 2 ---
				voices[#voices + 1] = wwise_voices[i]
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #6 ---

			FLOW; TARGET BLOCK #7



			-- Decompilation error in this vicinity:
			--- BLOCK #7 27-28, warpins: 3 ---
			--- END OF BLOCK #7 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 29-34, warpins: 1 ---
		voices = table.unique_array_values(voices)

		return voices
		--- END OF BLOCK #2 ---



	end,
	on_activated = function (voice)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		_select_voice(voice)

		return
		--- END OF BLOCK #0 ---



	end
}
functions.select_sound_event_type = {
	name = "02. Select Sound Event Type",
	category = "VO",
	dynamic_contents = true,
	get_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot0 = if not selected_sound_event_type then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-4, warpins: 1 ---
		slot0 = ""

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 5-5, warpins: 2 ---
		return slot0
		--- END OF BLOCK #2 ---



	end,
	options_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		return _sound_event_types()
		--- END OF BLOCK #0 ---



	end,
	on_activated = function (sound_event_type)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		selected_sound_event_type = sound_event_type
		selected_sound_event = nil

		return
		--- END OF BLOCK #0 ---



	end
}
functions.select_sound_event = {
	name = "03. Select Sound Event",
	category = "VO",
	dynamic_contents = true,
	get_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot0 = if not selected_sound_event then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-4, warpins: 1 ---
		slot0 = ""

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 5-5, warpins: 2 ---
		return slot0
		--- END OF BLOCK #2 ---



	end,
	options_function = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		return _sound_events()
		--- END OF BLOCK #0 ---



	end,
	on_activated = function (sound_event)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		selected_sound_event = sound_event

		return
		--- END OF BLOCK #0 ---



	end
}
functions.play_sound_event = {
	name = "04. Play Sound Event",
	category = "VO",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		_play_selected_sound_event()

		return
		--- END OF BLOCK #0 ---



	end
}
functions.apply_weapon_trait_lerp_value = {
	num_decimals = 2,
	name = "Override Weapon Trait Lerp Value",
	category = "WeaponTraits",
	number_button = true,
	on_activated = function (value)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		local local_player = Managers.player:local_player(1)

		--- END OF BLOCK #0 ---

		slot1 = if not local_player then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-9, warpins: 1 ---
		return

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 10-14, warpins: 2 ---
		local player_unit = local_player.player_unit

		--- END OF BLOCK #2 ---

		slot3 = if not ALIVE[player_unit] then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 15-15, warpins: 1 ---
		return

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 16-25, warpins: 2 ---
		local weapon_extension = ScriptUnit.extension(player_unit, "weapon_system")

		weapon_extension:debug_apply_trait_lerp_value(value)

		return
		--- END OF BLOCK #4 ---



	end
}
functions.reset_weapon_lerp_values = {
	name = "Remove Override Weapon Trait and Tweak Lerp Value",
	category = "WeaponTraits",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		local local_player = Managers.player:local_player(1)

		--- END OF BLOCK #0 ---

		slot0 = if not local_player then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-9, warpins: 1 ---
		return

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 10-14, warpins: 2 ---
		local player_unit = local_player.player_unit

		--- END OF BLOCK #2 ---

		slot2 = if not ALIVE[player_unit] then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 15-15, warpins: 1 ---
		return

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 16-24, warpins: 2 ---
		local weapon_extension = ScriptUnit.extension(player_unit, "weapon_system")

		weapon_extension:debug_remove_trait_lerp_value()

		return
		--- END OF BLOCK #4 ---



	end
}
functions.apply_lerp_value_to_all_tweak_templates = {
	num_decimals = 2,
	name = "Apply lerp_value to all tweak templates",
	category = "WeaponTraits",
	number_button = true,
	on_activated = function (value)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		local local_player = Managers.player:local_player(1)

		--- END OF BLOCK #0 ---

		slot1 = if not local_player then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-9, warpins: 1 ---
		return

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 10-14, warpins: 2 ---
		local player_unit = local_player.player_unit

		--- END OF BLOCK #2 ---

		slot3 = if not ALIVE[player_unit] then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 15-15, warpins: 1 ---
		return

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 16-25, warpins: 2 ---
		local weapon_extension = ScriptUnit.extension(player_unit, "weapon_system")

		weapon_extension:debug_apply_tweak_template_lerp_value(value)

		return
		--- END OF BLOCK #4 ---



	end
}
functions.verify_trait_templates = {
	name = "Verify Trait Templates",
	category = "WeaponTraits",
	on_activated = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		local trait_template_verification = require("scripts/settings/equipment/tests/trait_template_verification")
		local success = trait_template_verification()

		return
		--- END OF BLOCK #0 ---



	end
}

local function character_state_options()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	local options = {
		"hogtied",
		"knocked_down",
		"dead"
	}

	return options
	--- END OF BLOCK #0 ---



end

local function force_character_state(new_value)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	local is_server = Managers.state.game_session:is_server()

	--- END OF BLOCK #0 ---

	slot1 = if not is_server then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-13, warpins: 1 ---
	Log.info("DebugFunctions", "Can't set character state as client")

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-19, warpins: 2 ---
	local selected_unit = Debug.selected_unit

	--- END OF BLOCK #2 ---

	slot3 = if not ALIVE[selected_unit] then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-20, warpins: 1 ---
	return

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 21-27, warpins: 2 ---
	local unit_data_extension = ScriptUnit.has_extension(selected_unit, "unit_data_system")

	--- END OF BLOCK #4 ---

	slot3 = if not unit_data_extension then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 28-28, warpins: 1 ---
	return

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 29-37, warpins: 2 ---
	local breed_or_nil = unit_data_extension:breed()

	--- END OF BLOCK #6 ---

	slot5 = if not Breed.is_player(breed_or_nil)

	 then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 38-38, warpins: 1 ---
	return

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 39-40, warpins: 2 ---
	--- END OF BLOCK #8 ---

	if new_value == "hogtied" then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #10
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 41-47, warpins: 1 ---
	local hogtied_state_input = unit_data_extension:write_component("hogtied_state_input")
	hogtied_state_input.hogtie = true
	--- END OF BLOCK #9 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #10 48-49, warpins: 1 ---
	--- END OF BLOCK #10 ---

	if new_value == "knocked_down" then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 50-56, warpins: 1 ---
	local knocked_down_state_input = unit_data_extension:write_component("knocked_down_state_input")
	knocked_down_state_input.knock_down = true
	--- END OF BLOCK #11 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #12 57-58, warpins: 1 ---
	--- END OF BLOCK #12 ---

	if new_value == "dead" then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 59-64, warpins: 1 ---
	local dead_state_input = unit_data_extension:write_component("dead_state_input")
	dead_state_input.die = true

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 65-65, warpins: 4 ---
	return
	--- END OF BLOCK #14 ---



end

functions.force_character_state = {
	name = "Force character state",
	category = "Player Character",
	button_text = "Activate",
	options_function = character_state_options,
	on_activated = force_character_state
}

for key, config in pairs(functions) do

	-- Decompilation error in this vicinity:
	--- BLOCK #0 489-492, warpins: 1 ---
	local category = config.category

	--- END OF BLOCK #0 ---

	slot114 = if category then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 493-503, warpins: 1 ---
	fassert(table.contains(categories, category), "Debug Function %q has undefined category %q!", key, category)
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 504-505, warpins: 3 ---
	--- END OF BLOCK #2 ---



end

local debug_functions_initialized = false

local function initialize()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	local item_definitions = MasterItems.get_cached()

	_init_weapons(item_definitions)
	_init_equipment(item_definitions)
	_init_spawn_bot_character(item_definitions)
	_fetch_mission_board()

	debug_functions_initialized = true
	player_manager = Managers.player
	ui_manager = Managers.ui

	return
	--- END OF BLOCK #0 ---



end

return {
	parameters = functions,
	categories = categories,
	is_ready = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		return MasterItems.has_data()
		--- END OF BLOCK #0 ---



	end,
	is_initialized = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		return debug_functions_initialized
		--- END OF BLOCK #0 ---



	end,
	initialize = initialize
}