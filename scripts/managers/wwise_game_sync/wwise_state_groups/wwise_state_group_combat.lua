require("scripts/managers/wwise_game_sync/wwise_state_groups/wwise_state_group_base")

local WwiseGameSyncSettings = require("scripts/settings/wwise_game_sync/wwise_game_sync_settings")
local STATES = WwiseGameSyncSettings.state_groups.music_combat
local FAST_PARAMETER_UPDATE_RATE = 0.25
local SLOW_PARAMETER_UPDATE_RATE = 1
local WwiseStateGroupCombat = class("WwiseStateGroupCombat", "WwiseStateGroupBase")

WwiseStateGroupCombat.init = function (self, wwise_world, wwise_state_group_name)
	WwiseStateGroupCombat.super.init(self, wwise_world, wwise_state_group_name)

	self._next_fast_parameter_update = 0
	self._next_slow_parameter_update = 0
end

WwiseStateGroupCombat.update = function (self, dt, t)
	WwiseStateGroupCombat.super.update(self)

	local player_unit = self._player_unit

	if not player_unit or not ALIVE[player_unit] then
		return
	end

	if self._next_fast_parameter_update < t then
		self:_update_health()
		self:_update_intensity()

		self._next_fast_parameter_update = t + FAST_PARAMETER_UPDATE_RATE
	end

	if self._next_slow_parameter_update < t then
		self:_update_locked_in_melee()
		self:_update_num_aggroed_minions()

		self._next_slow_parameter_update = t + SLOW_PARAMETER_UPDATE_RATE
	end

	local wwise_state = self:_wwise_state()

	self:_set_wwise_state(wwise_state)
end

WwiseStateGroupCombat.set_followed_player_unit = function (self, player_unit)
	if player_unit then
		self._player_unit = player_unit
		self._music_parameter_extension = ScriptUnit.extension(player_unit, "music_parameter_system")
	else
		self._player_unit = nil
		self._music_parameter_extension = nil
	end
end

WwiseStateGroupCombat._wwise_state = function (self)
	local music_parameter_extension = self._music_parameter_extension
	local intensity_percent = music_parameter_extension:intensity_percent()

	if music_parameter_extension:boss_near() then
		return STATES.boss
	elseif music_parameter_extension:ambush_horde_near() then
		return STATES.horde
	elseif music_parameter_extension:vector_horde_near() then
		return STATES.horde
	elseif intensity_percent > 0 then
		return STATES.normal
	end

	return STATES.none
end

WwiseStateGroupCombat._update_health = function (self)
	local health = self._music_parameter_extension:health_percent()
	local wwise_value = health * 100

	WwiseWorld.set_global_parameter(self._wwise_world, "player_health", wwise_value)
end

WwiseStateGroupCombat._update_intensity = function (self)
	local intensity_percent = self._music_parameter_extension:intensity_percent()
	local wwise_value = intensity_percent * 100

	WwiseWorld.set_global_parameter(self._wwise_world, "player_attack_intensity", wwise_value)
end

WwiseStateGroupCombat._update_locked_in_melee = function (self)
	local locked_in_melee = self._music_parameter_extension:locked_in_melee()
	local wwise_value = locked_in_melee and 1 or 0

	WwiseWorld.set_global_parameter(self._wwise_world, "player_locked_in_melee", wwise_value)
end

WwiseStateGroupCombat._update_num_aggroed_minions = function (self)
	local num_aggroed_minions = self._music_parameter_extension:num_aggroed_minions()

	WwiseWorld.set_global_parameter(self._wwise_world, "minion_counter_global", num_aggroed_minions)
end

return WwiseStateGroupCombat