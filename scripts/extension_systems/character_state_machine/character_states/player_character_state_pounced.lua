require("scripts/extension_systems/character_state_machine/character_states/player_character_state_base")

local DialogueSettings = require("scripts/settings/dialogue/dialogue_settings")
local FirstPersonView = require("scripts/utilities/first_person_view")
local ForceRotation = require("scripts/extension_systems/locomotion/utilities/force_rotation")
local HealthStateTransitions = require("scripts/extension_systems/character_state_machine/character_states/utilities/health_state_transitions")
local Interrupt = require("scripts/utilities/attack/interrupt")
local LagCompensation = require("scripts/utilities/lag_compensation")
local Luggable = require("scripts/utilities/luggable")
local PlayerUnitVisualLoadout = require("scripts/extension_systems/visual_loadout/utilities/player_unit_visual_loadout")
local PlayerVoiceGrunts = require("scripts/utilities/player_voice_grunts")
local Vo = require("scripts/utilities/vo")
local PlayerCharacterStatePounced = class("PlayerCharacterStatePounced", "PlayerCharacterStateBase")
local SFX_SOURCE = "head"
local STINGER_ENTER_ALIAS = "disabled_enter"
local STINGER_EXIT_ALIAS = "disabled_exit"
local STINGER_PROPERTIES = {
	stinger_type = "pounced"
}
local VCE_ALIAS = "scream_long_vce"

PlayerCharacterStatePounced.init = function (self, character_state_init_context, ...)
	PlayerCharacterStatePounced.super.init(self, character_state_init_context, ...)

	local unit_data_extension = character_state_init_context.unit_data
	local disabled_character_state_component = unit_data_extension:write_component("disabled_character_state")
	disabled_character_state_component.is_disabled = false
	disabled_character_state_component.disabling_unit = nil
	disabled_character_state_component.disabling_type = "none"
	disabled_character_state_component.target_drag_position = Vector3.zero()
	self._disabled_character_state_component = disabled_character_state_component
	self._disabled_state_input = unit_data_extension:read_component("disabled_state_input")
end

PlayerCharacterStatePounced.on_enter = function (self, unit, dt, t, previous_state, params)
	local locomotion_steering_component = self._locomotion_steering_component
	local disabled_state_input = self._disabled_state_input
	locomotion_steering_component.move_method = "script_driven"
	locomotion_steering_component.velocity_wanted = Vector3.zero()
	locomotion_steering_component.calculate_fall_velocity = true
	self._movement_state_component.method = "idle"
	local pouncing_unit = disabled_state_input.disabling_unit
	local inventory_component = self._inventory_component
	local visual_loadout_extension = self._visual_loadout_extension
	local unit_data_extension = ScriptUnit.extension(pouncing_unit, "unit_data_system")
	self._pouncing_unit_breed = unit_data_extension:breed()

	Interrupt.ability_and_action(t, unit, "pounced", nil)
	Luggable.drop_luggable(t, unit, inventory_component, visual_loadout_extension, true)

	local disabled_character_state_component = self._disabled_character_state_component
	disabled_character_state_component.is_disabled = true
	disabled_character_state_component.disabling_unit = pouncing_unit
	disabled_character_state_component.disabling_type = "pounced"

	FirstPersonView.exit(t, self._first_person_mode_component)

	local pouncing_unit_rotation = Unit.world_rotation(pouncing_unit, 1)
	local force_rotation = Quaternion.look(-Quaternion.forward(pouncing_unit_rotation))

	ForceRotation.start(self._locomotion_force_rotation_component, locomotion_steering_component, force_rotation, force_rotation, t, 0)

	local is_server = self._is_server

	if is_server then
		self._fx_extension:trigger_gear_wwise_event_with_source(STINGER_ENTER_ALIAS, STINGER_PROPERTIES, SFX_SOURCE, true, true)
		self._dialogue_system:stop_currently_playing_vo()
		self:_init_player_vo(t)
	end

	local animation_extension = self._animation_extension

	PlayerUnitVisualLoadout.wield_slot("slot_unarmed", unit, t)
	animation_extension:anim_event("to_pounced")
end

PlayerCharacterStatePounced.on_exit = function (self, unit, t, next_state)
	local disabled_character_state_component = self._disabled_character_state_component
	disabled_character_state_component.is_disabled = false
	disabled_character_state_component.disabling_unit = nil
	disabled_character_state_component.disabling_type = "none"
	local first_person_mode_component = self._first_person_mode_component
	local rewind_ms = LagCompensation.rewind_ms(self._is_server, self._is_local_unit, self._player)

	FirstPersonView.enter(t, first_person_mode_component, rewind_ms)

	local animation_extension = self._animation_extension

	animation_extension:anim_event("leap_attack_interupt")

	local inventory_component = self._inventory_component
	local previously_wielded_slot_name = inventory_component.previously_wielded_slot

	PlayerUnitVisualLoadout.wield_slot(previously_wielded_slot_name, unit, t)

	local locomotion_force_rotation_component = self._locomotion_force_rotation_component

	if locomotion_force_rotation_component.use_force_rotation then
		ForceRotation.stop(locomotion_force_rotation_component)
	end

	if self._is_server and next_state == "walking" then
		self._fx_extension:trigger_exclusive_gear_wwise_event(STINGER_EXIT_ALIAS, STINGER_PROPERTIES)
	end

	self._stand_up_duration = nil
end

PlayerCharacterStatePounced.fixed_update = function (self, unit, dt, t, next_state_params, fixed_frame)
	local is_server = self._is_server

	if is_server and not self._stand_up_duration then
		self:_update_vo(t)
	end

	return self:_check_transition(unit, t, next_state_params)
end

local STAND_UP_DURATION = 2

PlayerCharacterStatePounced._check_transition = function (self, unit, t, next_state_params)
	local unit_data_extension = self._unit_data_extension
	local health_transition = HealthStateTransitions.poll(unit_data_extension, next_state_params)

	if health_transition then
		return health_transition
	end

	if not self._disabled_state_input.disabling_unit then
		if not self._stand_up_duration then
			self._stand_up_duration = t + STAND_UP_DURATION
			local animation_extension = self._animation_extension

			animation_extension:anim_event("pinned_stand_up")
		elseif self._stand_up_duration <= t then
			self._stand_up_duration = nil

			return "walking"
		end
	end

	return nil
end

PlayerCharacterStatePounced._init_player_vo = function (self, t)
	self._next_vo_trigger_time_t = t + DialogueSettings.pounced_vo_start_delay_t
	self._vo_sequence = 1
end

PlayerCharacterStatePounced._update_vo = function (self, t)
	if t <= self._next_vo_trigger_time_t then
		return
	end

	local vo_sequence = self._vo_sequence

	if vo_sequence == 1 then
		PlayerVoiceGrunts.trigger_sound(VCE_ALIAS, self._visual_loadout_extension, self._fx_extension)
	else
		local pouncing_unit_breed = self._pouncing_unit_breed

		Vo.player_pounced_by_special_event(self._unit, pouncing_unit_breed.name)
	end

	self._next_vo_trigger_time_t = t + DialogueSettings.pounced_vo_interval_t
	self._vo_sequence = vo_sequence + 1
end

return PlayerCharacterStatePounced