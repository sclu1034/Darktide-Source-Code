local PriorityQueue = require("scripts/foundation/utilities/priority_queue")
local HookStats = require("scripts/managers/stats/groups/hook_stats")
local StatsManager = class("StatsManager")

StatsManager.init = function (self, is_server)
	self._is_server = is_server

	if is_server then
		self._counter = 0
		self._last_time = 0
		self._player_to_ids = {}
		self._listeners = {}
		self._functions = {}
		self._account_id = {}
		self._stat_group = {}
		self._stat_data = {}
		self._queues = {}
	end
end

StatsManager._get_id = function (self)
	self._counter = self._counter + 1

	return self._counter
end

StatsManager._attach_id_to_player = function (self, player, id)
	local account_id = player:account_id()
	self._account_id[id] = account_id
	self._player_to_ids[account_id] = self._player_to_ids[account_id] or {}
	self._player_to_ids[account_id][#self._player_to_ids[account_id] + 1] = id
end

StatsManager._remove_id_from_player = function (self, id)
	local account_id = self._account_id[id]
	local player_to_ids = self._player_to_ids[account_id]

	if not player_to_ids then
		return false, "Player not tracked"
	end

	local index = table.index_of(player_to_ids, id)

	if index == -1 then
		return false, "ID not tracked by player"
	end

	self._account_id[id] = nil
	local size = #player_to_ids

	if size == 1 then
		self._player_to_ids[account_id] = nil

		return true
	end

	player_to_ids[index] = player_to_ids[size]
	player_to_ids[size] = nil

	return true
end

StatsManager._add_tracker = function (self, listener, stat_group, optional_function_to_call, optional_initial_data)
	local id = self:_get_id()
	self._listeners[id] = listener
	self._functions[id] = optional_function_to_call
	self._stat_group[id] = stat_group
	self._stat_data[id] = optional_initial_data or {}
	self._queues[id] = PriorityQueue:new()

	return id
end

StatsManager.add_tracker = function (self, listener, player, stat_group, optional_function_to_call, optional_initial_data)
	local id = self:_add_tracker(listener, stat_group, optional_function_to_call, optional_initial_data)

	self:_attach_id_to_player(player, id)

	return id
end

StatsManager.add_global_tracker = function (self, listener, stat_group, optional_function_to_call, optional_initial_data)
	return self:_add_tracker(listener, stat_group, optional_function_to_call, optional_initial_data)
end

StatsManager.remove_tracker = function (self, id)
	if self._account_id[id] then
		local removed, error = self:_remove_id_from_player(id)
	end

	local stat_data = self._stat_data[id]
	self._listeners[id] = nil
	self._functions[id] = nil
	self._stat_group[id] = nil
	self._stat_data[id] = nil
	self._queues[id] = nil

	return stat_data
end

StatsManager.update = function (self, dt, t)
	if self._is_server then
		self._last_time = t

		for id, queue in pairs(self._queues) do
			while not queue:empty() and queue:peek() < t do
				local _, delayed_trigger = queue:pop()
				local trigger_id = delayed_trigger[1]
				local trigger_value = delayed_trigger[2]
				local trigger_params = delayed_trigger[3]

				self:_on_triggered(id, trigger_id, trigger_value, unpack(trigger_params))
			end
		end
	end
end

StatsManager._handle_trigger = function (self, id, trigger_id, trigger_time, triggered_value, ...)
	if not trigger_time then
		return
	end

	if trigger_time == 0 then
		self:_on_triggered(id, trigger_id, triggered_value, ...)
	else
		self._queues[id]:push(self._last_time + trigger_time, {
			trigger_id,
			triggered_value,
			{
				...
			}
		})
	end
end

StatsManager._check_triggered = function (self, id, stat_id_to_check, triggering_id, triggering_value, ...)
	local stat_definition = self._stat_group[id].definitions[stat_id_to_check]
	local stat_data = self._stat_data[id]

	self:_handle_trigger(id, stat_id_to_check, stat_definition:trigger(stat_data, triggering_id, triggering_value, ...))
end

StatsManager._on_triggered = function (self, id, trigger_id, trigger_value, ...)
	local listening_function = self._functions[id]
	local listener = self._listeners[id]

	if listening_function and listener then
		listening_function(listener, id, trigger_id, trigger_value, ...)
	end

	local dependents = self._stat_group[id].triggered_by[trigger_id]
	local dependent_count = dependents and #dependents or 0

	for i = 1, dependent_count do
		local stat_id_to_check = dependents[i]

		self:_check_triggered(id, stat_id_to_check, trigger_id, trigger_value, ...)
	end
end

StatsManager._trigger_hook = function (self, player, trigger_id, trigger_value, ...)
	fassert(self._is_server, "Error, hook '%s' triggered on client.", trigger_id)

	local player_to_ids = self._player_to_ids[player:account_id()]
	local player_to_ids_count = player_to_ids and #player_to_ids or 0

	for i = 1, player_to_ids_count do
		local id = player_to_ids[i]

		self:_on_triggered(id, trigger_id, trigger_value, ...)
	end
end

StatsManager._trigger_global_hook = function (self, trigger_id, trigger_value, ...)
	fassert(self._is_server, "Error, hook '%s' triggered on client.", trigger_id)

	for id, _ in pairs(self._queues) do
		self:_on_triggered(id, trigger_id, trigger_value, ...)
	end
end

StatsManager.record_mission_end = function (self, player, mission_name, main_objective_type, challenge, resistance, win, mission_time, team_downs, team_deaths, side_objective_complete, side_objective_name)
	local difficulty = math.min(challenge, resistance)
	side_objective_name = side_objective_name or "none"

	self:_trigger_hook(player, "hook_mission", 1, mission_name, main_objective_type, difficulty, win, mission_time, team_downs, team_deaths, side_objective_complete, side_objective_name, player:profile().specialization)
end

StatsManager.record_objective_complete = function (self, player, mission_name, objective_name, objective_type, objective_time)
	self:_trigger_hook(player, "hook_objective", 1, mission_name, objective_name, objective_type, objective_time, player:profile().specialization)
end

StatsManager.record_damage = function (self, player, breed_name, weapon_template_name, weapon_attack_type, hit_zone_name, distance, player_health, action, id, damage)
	breed_name = breed_name or "unknown"
	weapon_template_name = weapon_template_name or "unknown"
	weapon_attack_type = weapon_attack_type or "unknown"
	hit_zone_name = hit_zone_name or "unknown"
	action = action or "unknown"

	self:_trigger_hook(player, "hook_damage", damage, breed_name, weapon_template_name, weapon_attack_type, hit_zone_name, distance, player_health, action, id, player:profile().specialization)
end

StatsManager.record_kill = function (self, player, breed_name, weapon_template_name, weapon_attack_type, hit_zone_name, distance, player_health, action)
	breed_name = breed_name or "unknown"
	weapon_template_name = weapon_template_name or "unknown"
	weapon_attack_type = weapon_attack_type or "unknown"
	hit_zone_name = hit_zone_name or "unknown"
	action = action or "unknown"

	self:_trigger_hook(player, "hook_kill", 1, breed_name, weapon_template_name, weapon_attack_type, hit_zone_name, distance, player_health, action, player:profile().specialization)
end

StatsManager.record_blocked_damage = function (self, player, amount, weapon_template_name)
	self:_trigger_hook(player, "hook_blocked_damage", amount, weapon_template_name or "unknown", player:profile().specialization)
end

StatsManager.record_team_kill = function (self)
	self:_trigger_global_hook("hook_team_kill", 1)
end

StatsManager.record_toughness_regen = function (self, player, reason, amount)
	self:_trigger_hook(player, "hook_toughness_regenerated", amount, reason, player:profile().specialization)
end

StatsManager.record_dodge = function (self, player, attacker_breed, attack_type, reason)
	attacker_breed = attacker_breed or "unknown"

	self:_trigger_hook(player, "hook_dodge", 1, attack_type, attacker_breed, reason, player:profile().specialization)
end

StatsManager.record_respawn_ally = function (self, player)
	self:_trigger_hook(player, "hook_respawn_ally", 1, player:profile().specialization)
end

StatsManager.record_help_ally = function (self, player)
	self:_trigger_hook(player, "hook_help_ally", 1, player:profile().specialization)
end

StatsManager.record_collect_material = function (self, player, type, size)
	type = type or "unknown"
	local amount = size == "large" and 10 or size == "small" and 5 or 0

	self:_trigger_hook(player, "hook_collect_material", amount, type, player:profile().specialization)
end

StatsManager.record_pickup_item = function (self, player, pickup_name)
	self:_trigger_hook(player, "hook_pickup_item", 1, pickup_name, player:profile().specialization)
end

StatsManager.record_place_item = function (self, player, pickup_name)
	self:_trigger_hook(player, "hook_place_item", 1, pickup_name, player:profile().specialization)
end

StatsManager.record_share_item = function (self, player, pickup_name)
	self:_trigger_hook(player, "hook_share_item", 1, pickup_name, player:profile().specialization)
end

StatsManager.record_player_death = function (self, player)
	self:_trigger_hook(player, "hook_death", 1, player:profile().specialization)
end

StatsManager.record_player_knock_down = function (self, player)
	self:_trigger_hook(player, "hook_knock_down", 1, player:profile().specialization)
end

StatsManager.record_player_damage_taken = function (self, player, amount)
	self:_trigger_hook(player, "hook_damage_taken", amount, player:profile().specialization)
end

StatsManager.record_team_damage_taken = function (self, amount)
	self:_trigger_global_hook("hook_team_damage_taken", amount)
end

StatsManager.record_team_death = function (self)
	self:_trigger_global_hook("hook_team_death", 1)
end

StatsManager.record_team_knock_down = function (self)
	self:_trigger_global_hook("hook_team_knock_down", 1)
end

StatsManager.record_player_spawned = function (self, player)
	self:_trigger_hook(player, "hook_spawn_player", player:profile().current_level, player:profile().specialization)
end

StatsManager.record_hacked_terminal = function (self, player, mistakes)
	self:_trigger_hook(player, "hook_hacked_terminal", 1, mistakes, player:profile().specialization)
end

StatsManager.record_scanned_objects = function (self, player, amount)
	self:_trigger_hook(player, "hook_scanned_objects", amount, player:profile().specialization)
end

StatsManager.record_team_corruptor_destroyed = function (self)
	self:_trigger_global_hook("hook_team_corruptor_destroyed", 1)
end

StatsManager.record_boss_death = function (self, max_health, id, breed_name, time_since_first_damage, action)
	self:_trigger_global_hook("hook_boss_kill", 1, breed_name, max_health, id, time_since_first_damage, action)
end

return StatsManager