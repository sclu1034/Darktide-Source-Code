require("scripts/extension_systems/character_state_machine/character_states/player_character_state_base")

local DisruptiveStateTransition = require("scripts/extension_systems/character_state_machine/character_states/utilities/disruptive_state_transition")
local HealthStateTransitions = require("scripts/extension_systems/character_state_machine/character_states/utilities/health_state_transitions")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local proc_events = BuffSettings.proc_events
local FOOTSTEP_DODGE_SOUND_ALIAS = "sfx_footstep_dodge"
local UPPER_BODY_FOLEY = "sfx_foley_upper_body"
local WEAPON_FOLEY = "sfx_weapon_locomotion"
local EXTRA_FOLEY = "sfx_player_extra_slot"
local PlayerCharacterStateDodging = class("PlayerCharacterStateDodging", "PlayerCharacterStateBase")

PlayerCharacterStateDodging.init = function (self, character_state_init_context, ...)
	PlayerCharacterStateDodging.super.init(self, character_state_init_context, ...)

	local dodge_character_state_component = character_state_init_context.unit_data:write_component("dodge_character_state")
	dodge_character_state_component.cooldown = 0
	dodge_character_state_component.consecutive_dodges = 0
	dodge_character_state_component.consecutive_dodges_cooldown = 0
	dodge_character_state_component.distance_left = 0
	dodge_character_state_component.dodge_direction = Vector3.zero()
	dodge_character_state_component.jump_override_time = 0
	dodge_character_state_component.dodge_time = 0
	self._dodge_character_state_component = dodge_character_state_component
	self._archetype_dodge_template = self._archetype.dodge
end

PlayerCharacterStateDodging._on_enter_animation = function (self, unit, dodge_direction, estimated_dodge_time, animation_extension)
	local x_value = Vector3.x(dodge_direction)
	local y_value = Vector3.y(dodge_direction)
	local dodge_animation = nil

	if math.abs(x_value) < math.abs(y_value) then
		dodge_animation = "dodge_bwd"
	elseif x_value > 0 then
		dodge_animation = "dodge_right"
	else
		dodge_animation = "dodge_left"
	end

	estimated_dodge_time = math.clamp(estimated_dodge_time, 0, 1)

	animation_extension:anim_event_with_variable_float(dodge_animation, "dodge_time", estimated_dodge_time)
	animation_extension:anim_event_1p(dodge_animation)
end

local function _calculate_dodge_diminishing_return(dodge_character_state_component, weapon_dodge_template, buff_extension)
	local stat_buffs = buff_extension:stat_buffs()
	local extra_consecutive_dodges = math.round(stat_buffs.extra_consecutive_dodges or 0)
	local dr_start = (weapon_dodge_template and weapon_dodge_template.diminishing_return_start or 2) + extra_consecutive_dodges
	local dr_limit = dr_start + (weapon_dodge_template and weapon_dodge_template.diminishing_return_limit or 1)
	local consecutive_dodges = math.min(dodge_character_state_component.consecutive_dodges, dr_limit + dr_start)
	local dr_distance_modifier = weapon_dodge_template and weapon_dodge_template.diminishing_return_distance_modifier or 1
	local base = 1 - dr_distance_modifier
	local diminishing_return = base + dr_distance_modifier * (1 - math.clamp(consecutive_dodges - dr_start, 0, dr_limit) / dr_limit)

	return diminishing_return
end

local function _find_speed_settings_index(time_in_dodge, start_index, dodge_speed_at_times, distance_scale)
	local speed_settings_index = #dodge_speed_at_times

	for index = start_index, #dodge_speed_at_times do
		if dodge_speed_at_times[index].time_in_dodge >= time_in_dodge / distance_scale then
			speed_settings_index = index - 1

			break
		end
	end

	return speed_settings_index
end

local function _find_current_dodge_speed(time_in_dodge, speed_settings_index, dodge_speed_at_times, speed_modifier, diminishing_return_factor, distance_scale)
	local speed = nil
	local num_dodge_speed_at_times = #dodge_speed_at_times
	local total_modifier = speed_modifier * diminishing_return_factor
	local next_speed_setting_index = speed_settings_index + 1

	if num_dodge_speed_at_times >= next_speed_setting_index then
		local current_speed_settings = dodge_speed_at_times[speed_settings_index]
		local next_speed_settings = dodge_speed_at_times[next_speed_setting_index]
		local current_time_in_setting = current_speed_settings.time_in_dodge
		local next_time_in_setting = next_speed_settings.time_in_dodge
		local current_setting_speed = current_speed_settings.speed * distance_scale
		local next_setting_speed = next_speed_settings.speed * distance_scale
		local time_between_settings = next_time_in_setting - current_time_in_setting
		local time_in_setting = time_in_dodge / distance_scale - current_time_in_setting
		local percentage_in_between = time_in_setting / time_between_settings
		speed = math.lerp(current_setting_speed, next_setting_speed, percentage_in_between) * total_modifier
	else
		local current_speed_settings = dodge_speed_at_times[speed_settings_index]
		local current_setting_speed = current_speed_settings.speed
		speed = current_setting_speed * total_modifier
	end

	return speed
end

local function _calculate_dodge_total_time(archetype_dodge_template, diminishing_return_factor, weapon_dodge_template, buff_extension)
	local time_step = GameParameters.fixed_time_step
	local hit_end = false
	local time_in_dodge = 0
	local distance_travelled = 0
	local stat_buffs = buff_extension:stat_buffs()
	local weapon_speed_modifier = weapon_dodge_template and weapon_dodge_template.speed_modifier or 1
	local buff_speed_modifier = stat_buffs.dodge_speed_multiplier
	local speed_modifier = weapon_speed_modifier * buff_speed_modifier
	local distance_scale = (weapon_dodge_template and weapon_dodge_template.distance_scale or 1) * diminishing_return_factor
	local dodge_distance = archetype_dodge_template.base_distance * distance_scale

	if dodge_distance <= 0 then
		return 0
	end

	local dodge_speed_at_times = archetype_dodge_template.dodge_speed_at_times

	while not hit_end do
		time_in_dodge = time_in_dodge + time_step
		local start_point = 1
		local current_speed_setting_index = _find_speed_settings_index(time_in_dodge, start_point, dodge_speed_at_times, distance_scale)
		local speed = _find_current_dodge_speed(time_in_dodge, current_speed_setting_index, dodge_speed_at_times, speed_modifier, diminishing_return_factor, distance_scale)

		fassert(speed > 0, "Dodge speed is 0, will never hit end.")

		distance_travelled = distance_travelled + speed * time_step

		if dodge_distance < distance_travelled then
			hit_end = true
		end
	end

	return time_in_dodge * 10
end

PlayerCharacterStateDodging.on_enter = function (self, unit, dt, t, previous_state, params)
	local archetype_dodge_template = self._archetype_dodge_template
	local dodge_character_state_component = self._dodge_character_state_component
	local weapon_dodge_template = self._weapon_extension:dodge_template()
	local dodge_direction = params.dodge_direction

	fassert(dodge_direction, "You need to set dodge_direction in params")

	dodge_character_state_component.dodge_direction = dodge_direction
	params.dodge_direction = nil

	if dodge_character_state_component.consecutive_dodges_cooldown < t then
		dodge_character_state_component.consecutive_dodges = 1
	else
		dodge_character_state_component.consecutive_dodges = math.min(dodge_character_state_component.consecutive_dodges + 1, NetworkConstants.max_consecutive_dodges)
	end

	local diminishing_return_factor = _calculate_dodge_diminishing_return(dodge_character_state_component, weapon_dodge_template, self._buff_extension)
	dodge_character_state_component.distance_left = archetype_dodge_template.base_distance * (weapon_dodge_template and weapon_dodge_template.distance_scale or 1) * diminishing_return_factor
	dodge_character_state_component.jump_override_time = t + archetype_dodge_template.dodge_jump_override_timer
	local estimated_dodge_time = _calculate_dodge_total_time(archetype_dodge_template, diminishing_return_factor, weapon_dodge_template, self._buff_extension)

	self:_on_enter_animation(unit, dodge_direction, estimated_dodge_time, self._animation_extension)
	self:_trigger_footstep_and_foley(FOOTSTEP_DODGE_SOUND_ALIAS, UPPER_BODY_FOLEY, WEAPON_FOLEY, EXTRA_FOLEY)

	self._locomotion_steering_component.disable_velocity_rotation = true
	local movement_state = self._movement_state_component
	movement_state.method = "dodging"
	movement_state.is_dodging = true
end

PlayerCharacterStateDodging.on_exit = function (self, unit, t, next_state)
	local dodge_character_state_component = self._dodge_character_state_component
	local archetype_dodge_template = self._archetype_dodge_template
	local buff_extension = self._buff_extension
	local stat_buffs = buff_extension:stat_buffs()
	local time_in_dodge = t - self._character_state_component.entered_t
	local cd = math.max(archetype_dodge_template.dodge_cooldown, archetype_dodge_template.dodge_jump_override_timer - time_in_dodge)
	dodge_character_state_component.cooldown = t + cd
	dodge_character_state_component.consecutive_dodges_cooldown = t + archetype_dodge_template.consecutive_dodges_reset
	dodge_character_state_component.dodge_time = t
	self._movement_state_component.is_dodging = false
	self._locomotion_steering_component.disable_velocity_rotation = false
	local animation_extension = self._animation_extension
	local dodge_animation = "dodge_end"

	animation_extension:anim_event(dodge_animation)
	animation_extension:anim_event_1p(dodge_animation)

	local param_table = buff_extension:request_proc_event_param_table()

	buff_extension:add_proc_event(proc_events.on_dodge_end, param_table)
end

PlayerCharacterStateDodging.fixed_update = function (self, unit, dt, t, next_state_params, fixed_frame)
	local time_in_dodge = t - self._character_state_component.entered_t

	self._weapon_extension:update_weapon_actions(fixed_frame)
	self._ability_extension:update_ability_actions(fixed_frame)

	local input_ext = self._input_extension
	local still_dodging = self:_update_dodge(unit, dt, time_in_dodge)

	return self:_check_transition(unit, t, input_ext, next_state_params, still_dodging)
end

PlayerCharacterStateDodging._check_transition = function (self, unit, t, input_extension, next_state_params, still_dodging)
	local unit_data_extension = self._unit_data_extension
	local health_transition = HealthStateTransitions.poll(unit_data_extension, next_state_params)

	if health_transition then
		return health_transition
	end

	local is_colliding_on_hang_ledge, hang_ledge_unit = self:_should_hang_on_ledge(unit, t)

	if is_colliding_on_hang_ledge then
		next_state_params.hang_ledge_unit = hang_ledge_unit

		return "ledge_hanging"
	end

	local disruptive_transition = DisruptiveStateTransition.poll(unit, unit_data_extension, next_state_params)

	if disruptive_transition then
		return disruptive_transition
	end

	local dodge_character_state_component = self._dodge_character_state_component
	local movement_state = self._movement_state_component

	if input_extension:get("jump") and t < dodge_character_state_component.jump_override_time and movement_state.can_jump then
		next_state_params.post_dodge_jump = true

		return "jumping"
	end

	local inair_state = self._inair_state_component

	if not inair_state.on_ground then
		return "falling"
	end

	local is_sticky = self._action_sweep_component.is_sticky
	local should_cancel = is_sticky

	if not still_dodging or should_cancel then
		return "walking"
	end
end

PlayerCharacterStateDodging._update_dodge = function (self, unit, dt, time_in_dodge)
	local archetype_dodge_template = self._archetype_dodge_template
	local dodge_character_state_component = self._dodge_character_state_component
	local weapon_dodge_template = self._weapon_extension:dodge_template()
	local locomotion_steering_component = self._locomotion_steering_component
	local prev_wanted_velocity = locomotion_steering_component.velocity_wanted
	local velocity_current = self._locomotion_component.velocity_current
	local prev_velocity_wanted_flat = Vector3.flat(prev_wanted_velocity)
	local velocity_current_flat = Vector3.flat(velocity_current)
	local prev_length_sq = Vector3.length_squared(prev_velocity_wanted_flat)
	local current_length_sq = Vector3.length_squared(velocity_current_flat)
	local amount_progressed_from_wanted = current_length_sq / prev_length_sq

	if amount_progressed_from_wanted < archetype_dodge_template.stop_threshold then
		return false
	end

	if dodge_character_state_component.distance_left <= 0 then
		return false
	end

	local speed_at_times = archetype_dodge_template.dodge_speed_at_times
	local start_point = 1
	local diminishing_return_factor = _calculate_dodge_diminishing_return(dodge_character_state_component, weapon_dodge_template, self._buff_extension)
	local distance_scale = (weapon_dodge_template and weapon_dodge_template.distance_scale or 1) * diminishing_return_factor
	local current_speed_setting_index = _find_speed_settings_index(time_in_dodge, start_point, speed_at_times, distance_scale)
	local speed_modifier = weapon_dodge_template and weapon_dodge_template.speed_modifier or 1
	local base_speed = _find_current_dodge_speed(time_in_dodge, current_speed_setting_index, speed_at_times, speed_modifier, diminishing_return_factor, distance_scale)
	local stat_buffs = self._buff_extension:stat_buffs()
	local buff_speed_modifier = stat_buffs.dodge_speed_multiplier
	local speed = base_speed * buff_speed_modifier
	local unit_rotation = self._first_person_component.rotation
	local flat_unit_rotation = Quaternion.look(Vector3.normalize(Vector3.flat(Quaternion.forward(unit_rotation))), Vector3.up())
	local move_direction = Quaternion.rotate(flat_unit_rotation, dodge_character_state_component.dodge_direction)
	self._locomotion_steering_component.velocity_wanted = move_direction * speed
	local move_delta = speed * dt
	dodge_character_state_component.distance_left = math.max(dodge_character_state_component.distance_left - move_delta, 0)

	return true
end

return PlayerCharacterStateDodging