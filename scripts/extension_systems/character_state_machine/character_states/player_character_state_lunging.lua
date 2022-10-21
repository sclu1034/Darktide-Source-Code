require("scripts/extension_systems/character_state_machine/character_states/player_character_state_base")

local ActionAvailability = require("scripts/extension_systems/weapon/utilities/action_availability")
local Armor = require("scripts/utilities/attack/armor")
local Attack = require("scripts/utilities/attack/attack")
local AttackSettings = require("scripts/settings/damage/attack_settings")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local DamageProfile = require("scripts/utilities/attack/damage_profile")
local DisruptiveStateTransition = require("scripts/extension_systems/character_state_machine/character_states/utilities/disruptive_state_transition")
local Explosion = require("scripts/utilities/attack/explosion")
local HealthStateTransitions = require("scripts/extension_systems/character_state_machine/character_states/utilities/health_state_transitions")
local HitMass = require("scripts/utilities/attack/hit_mass")
local ImpactEffect = require("scripts/utilities/attack/impact_effect")
local Interrupt = require("scripts/utilities/attack/interrupt")
local LagCompensation = require("scripts/utilities/lag_compensation")
local Luggable = require("scripts/utilities/luggable")
local Lunge = require("scripts/utilities/player_state/lunge")
local LungeTemplates = require("scripts/settings/lunge/lunge_templates")
local PlayerMovement = require("scripts/utilities/player_movement")
local PlayerUnitVisualLoadout = require("scripts/extension_systems/visual_loadout/utilities/player_unit_visual_loadout")
local Sprint = require("scripts/extension_systems/character_state_machine/character_states/utilities/sprint")
local Toughness = require("scripts/utilities/toughness/toughness")
local WeaponTemplate = require("scripts/utilities/weapon/weapon_template")
local proc_events = BuffSettings.proc_events
local DAMAGE_COLLISION_FILTER = "filter_player_character_lunge"
local DEFUALT_POWER_LEVEL = 500
local _max_hit_mass = nil
local PlayerCharacterStateLunging = class("PlayerCharacterStateLunging", "PlayerCharacterStateBase")

PlayerCharacterStateLunging.init = function (self, character_state_init_context, ...)
	PlayerCharacterStateLunging.super.init(self, character_state_init_context, ...)

	local lunge_character_state_component = character_state_init_context.unit_data:write_component("lunge_character_state")
	lunge_character_state_component.is_lunging = false
	lunge_character_state_component.is_aiming = false
	lunge_character_state_component.distance_left = 0
	lunge_character_state_component.direction = Vector3.zero()
	lunge_character_state_component.lunge_template = "none"
	lunge_character_state_component.lunge_target = nil
	self._lunge_character_state_component = lunge_character_state_component
	local character_state_hit_mass_component = character_state_init_context.unit_data:write_component("character_state_hit_mass")
	character_state_hit_mass_component.used_hit_mass_percentage = 0
	self._character_state_hit_mass_component = character_state_hit_mass_component
	self._locomotion_push_component = character_state_init_context.unit_data:write_component("locomotion_push")
	self._hit_enemy_units = {}
	self._last_hit_unit = nil
	self._played_timing_anims = {}
end

PlayerCharacterStateLunging._play_animation = function (self, animation_extension, anim_event)
	animation_extension:anim_event(anim_event)
	animation_extension:anim_event_1p(anim_event)
end

local stop_action_data = {}

PlayerCharacterStateLunging.on_enter = function (self, unit, dt, t, previous_state, params)
	local locomotion_steering = self._locomotion_steering_component
	locomotion_steering.move_method = "script_driven"
	locomotion_steering.calculate_fall_velocity = true
	self._locomotion_push_component.new_velocity = Vector3.zero()
	local lunge_template_name = params.lunge_template_name
	local lunge_template = LungeTemplates[lunge_template_name]

	fassert(lunge_template, "PlayerCharacterStateLunging requires a lunge_template.")

	if lunge_template.disable_minion_collision then
		locomotion_steering.disable_minion_collision = true
	end

	table.clear(stop_action_data)

	local action_settings = self._weapon_extension:running_action_settings()

	if action_settings and not ActionAvailability.available_in_lunge(action_settings) then
		Interrupt.ability_and_action(t, unit, "lunging", nil)
	end

	Luggable.drop_luggable(t, unit, self._inventory_component, self._visual_loadout_extension, true)

	local lunge_character_state_component = self._lunge_character_state_component
	local lunge_target = lunge_character_state_component.lunge_target
	local has_target = lunge_target ~= nil
	local distance = Lunge.distance(lunge_template, has_target)

	if has_target then
		local lunge_target_position = POSITION_LOOKUP[lunge_target]
		local unit_position = POSITION_LOOKUP[unit]
		local distance_to_unit = Vector3.distance(unit_position, lunge_target_position)
		distance = math.min(distance, distance_to_unit)
	end

	local unit_rotation = self._first_person_component.rotation
	local flat_direction = Vector3.normalize(Vector3.flat(Quaternion.forward(unit_rotation)))
	local directional_lunge = lunge_template.directional_lunge

	if directional_lunge then
		local move_input = self._input_extension:get("move")
		local rotation = self._first_person_component.rotation
		local move_direction = Quaternion.rotate(rotation, move_input)
		move_direction = Vector3.flat(move_direction)
		flat_direction = move_direction

		if Vector3.length_squared(move_direction) == 0 then
			local forward_direction = Quaternion.forward(rotation)
			flat_direction = forward_direction
		end
	end

	if lunge_template.disallow_weapons then
		PlayerUnitVisualLoadout.wield_slot("slot_unarmed", unit, t)
	end

	local anim_settings = lunge_template.anim_settings
	local on_enter_animation = anim_settings and anim_settings.on_enter

	if on_enter_animation then
		self:_play_animation(self._animation_extension, on_enter_animation)
	end

	local proc_event_param_table = self._buff_extension:request_proc_event_param_table()
	local lunge_template_name = self._lunge_character_state_component.lunge_template
	proc_event_param_table.lunging_unit = unit
	proc_event_param_table.last_hit_unit = self._last_hit_unit
	proc_event_param_table.lunge_template_name = lunge_template_name
	proc_event_param_table.lunge_direction = Vector3Box(flat_direction)

	self._buff_extension:add_proc_event(proc_events.on_start_lunge, proc_event_param_table)

	local character_state_hit_mass_component = self._character_state_hit_mass_component
	lunge_character_state_component.is_lunging = true
	lunge_character_state_component.distance_left = distance
	lunge_character_state_component.direction = flat_direction
	lunge_character_state_component.lunge_template = lunge_template.name
	character_state_hit_mass_component.used_hit_mass_percentage = 0
	local movement_state_component = self._movement_state_component
	movement_state_component.method = "lunging"

	if lunge_template.is_dodging then
		movement_state_component.is_dodging = true
	end

	if self._is_server then
		if lunge_template.restore_toughness then
			Toughness.recover_max_toughness(unit)
		end

		local buff = lunge_template.add_buff

		if buff then
			local buff_extension = self._buff_extension

			if type(buff) == "table" then
				for _, buff_name in pairs(buff) do
					buff_extension:add_internally_controlled_buff(buff_name, t)
				end
			else
				buff_extension:add_internally_controlled_buff(buff, t)
			end
		end

		self._add_delayed_buff = lunge_template.add_delayed_buff
	end

	local start_sound_event = lunge_template.start_sound_event

	if start_sound_event and self._is_local_unit then
		self._fx_extension:trigger_wwise_event(start_sound_event, false)
	end

	local wwise_state = lunge_template.wwise_state

	if wwise_state then
		Wwise.set_state(wwise_state.group, wwise_state.on_state)
	end

	table.clear(self._played_timing_anims)
	table.clear(self._hit_enemy_units)

	self._last_hit_unit = nil
end

PlayerCharacterStateLunging.on_exit = function (self, unit, t, next_state)
	local movement_state_component = self._movement_state_component
	movement_state_component.is_dodging = false
	local lunge_character_state_component = self._lunge_character_state_component
	lunge_character_state_component.is_lunging = false
	self._locomotion_steering_component.disable_minion_collision = false

	if next_state == "sprinting" then
		movement_state_component.method = "sprint"
	end

	local lunge_template_name = self._lunge_character_state_component.lunge_template
	local lunge_template = LungeTemplates[lunge_template_name]
	local anim_settings = lunge_template.anim_settings
	local on_exit_anim = anim_settings and anim_settings.on_exit

	if on_exit_anim then
		self:_play_animation(self._animation_extension, on_exit_anim)
	end

	local lunge_end_camera_shake = lunge_template.lunge_end_camera_shake

	if not self._unit_data_extension.is_resimulating and lunge_end_camera_shake then
		local will_be_predicted = true

		self._camera_extension:trigger_camera_shake(lunge_end_camera_shake, will_be_predicted)
	end

	if lunge_template.disallow_weapons then
		PlayerUnitVisualLoadout.wield_previous_slot(self._inventory_component, unit, t)
	end

	local direction = lunge_character_state_component.direction
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local proc_event_param_table = buff_extension:request_proc_event_param_table()
	proc_event_param_table.lunging_unit = unit
	proc_event_param_table.last_hit_unit = self._last_hit_unit
	proc_event_param_table.lunge_template_name = lunge_template_name
	proc_event_param_table.lunge_direction = Vector3Box(direction)

	buff_extension:add_proc_event(proc_events.on_finished_lunge, proc_event_param_table)

	local on_finish_explosion = lunge_template.on_finish_explosion

	if self._is_server and on_finish_explosion then
		local explosion_template = on_finish_explosion.explosion_template
		local forward_offset = on_finish_explosion.forward_offset
		local vertical_offset = on_finish_explosion.vertical_offset or 0
		local position = self._locomotion_component.position
		local impact_normal = nil
		local power_level = 600
		local charge_level, attack_type = nil

		Explosion.create_explosion(self._world, self._physics_world, position + direction * forward_offset + Vector3.up() * vertical_offset, impact_normal, unit, explosion_template, power_level, charge_level, attack_type)
	end

	local stop_sound_event = lunge_template.stop_sound_event

	if stop_sound_event and self._is_local_unit then
		self._fx_extension:trigger_wwise_event(stop_sound_event, false)
	end

	local wwise_state = lunge_template.wwise_state

	if wwise_state then
		Wwise.set_state(wwise_state.group, wwise_state.off_state)
	end

	table.clear(self._played_timing_anims)
	table.clear(self._hit_enemy_units)
end

PlayerCharacterStateLunging.fixed_update = function (self, unit, dt, t, next_state_params, fixed_frame)
	local lunge_character_state_component = self._lunge_character_state_component
	local time_in_lunge = t - self._character_state_component.entered_t

	self._weapon_extension:update_weapon_actions(fixed_frame)
	self._ability_extension:update_ability_actions(fixed_frame)

	local lunge_template_name = lunge_character_state_component.lunge_template
	local lunge_template = LungeTemplates[lunge_template_name]
	local max_mass_hit = false
	local damage_settings = lunge_template and lunge_template.damage_settings

	if damage_settings and not self._unit_data_extension.is_resimulating then
		max_mass_hit = self:_update_enemy_hit_detection(unit, lunge_template)
	end

	local still_lunging = nil

	if lunge_template then
		still_lunging = self:_update_lunge(unit, dt, time_in_lunge, lunge_template)
	end

	local add_delayed_buff = self._add_delayed_buff

	if add_delayed_buff then
		local add_buff_delay = lunge_template.add_buff_delay or 0

		if time_in_lunge >= add_buff_delay then
			local buff_extension = self._buff_extension

			if type(add_delayed_buff) == "table" then
				for _, buff_name in pairs(add_delayed_buff) do
					buff_extension:add_internally_controlled_buff(buff_name, t)
				end
			else
				buff_extension:add_internally_controlled_buff(add_delayed_buff, t)
			end

			self._add_delayed_buff = nil
		end
	end

	local anim_settings = lunge_template.anim_settings
	local timing_anims = anim_settings and anim_settings.timing_anims

	if timing_anims then
		self:_update_timing_anims(timing_anims, time_in_lunge)
	end

	return self:_check_transition(unit, t, self._input_extension, next_state_params, max_mass_hit, still_lunging, lunge_template, time_in_lunge)
end

PlayerCharacterStateLunging._check_transition = function (self, unit, t, input_extension, next_state_params, max_mass_hit, still_lunging, lunge_template, time_in_lunge)
	local unit_data_extension = self._unit_data_extension
	local health_transition = HealthStateTransitions.poll(unit_data_extension, next_state_params)

	if health_transition then
		return health_transition
	end

	local disruptive_transition = DisruptiveStateTransition.poll(unit, unit_data_extension, next_state_params)

	if disruptive_transition then
		return disruptive_transition
	end

	local is_colliding_on_hang_ledge, hang_ledge_unit = self:_should_hang_on_ledge(unit, t)

	if is_colliding_on_hang_ledge then
		next_state_params.hang_ledge_unit = hang_ledge_unit

		return "ledge_hanging"
	end

	local block_cancel = lunge_template and lunge_template.block_input_cancel and input_extension:get("action_two_pressed")
	local move_back_cancel_time_threshold = lunge_template and lunge_template.move_back_cancel_time_threshold or 0
	local move_back_cancel = lunge_template and lunge_template.move_back_cancel and input_extension:get("move").y < -0.1 and move_back_cancel_time_threshold < time_in_lunge

	if block_cancel or move_back_cancel then
		return "walking"
	end

	if max_mass_hit then
		return "walking"
	end

	if not still_lunging then
		local weapon_action_component = self._weapon_action_component
		local weapon_template = WeaponTemplate.current_weapon_template(weapon_action_component)
		local wants_sprint = Sprint.check(t, unit, self._movement_state_component, self._sprint_character_state_component, input_extension, self._locomotion_component, weapon_action_component, self._alternate_fire_component, weapon_template, self._constants)

		if wants_sprint then
			return "sprinting"
		else
			return "walking"
		end
	end
end

PlayerCharacterStateLunging._update_lunge = function (self, unit, dt, time_in_lunge, lunge_template)
	local lunge_character_state_component = self._lunge_character_state_component
	local locomotion_steering_component = self._locomotion_steering_component
	local prev_wanted_velocity = locomotion_steering_component.velocity_wanted
	local velocity_current = self._locomotion_component.velocity_current
	local prev_velocity_wanted_flat = Vector3.flat(prev_wanted_velocity)
	local velocity_current_flat = Vector3.flat(velocity_current)
	local prev_length_sq = Vector3.length_squared(prev_velocity_wanted_flat)
	local current_length_sq = Vector3.length_squared(velocity_current_flat)
	local amount_progressed_from_wanted = current_length_sq / prev_length_sq

	if amount_progressed_from_wanted < 0.1 then
		return false
	end

	if lunge_character_state_component.distance_left <= 0 then
		return false
	end

	local start_point = 1
	local lunge_speed_at_times = lunge_template.lunge_speed_at_times
	local current_speed_setting_index = Lunge.find_speed_settings_index(time_in_lunge, start_point, lunge_speed_at_times)
	local speed = Lunge.find_current_lunge_speed(time_in_lunge, current_speed_setting_index, lunge_speed_at_times)
	local direction = lunge_character_state_component.direction
	local lunge_target = lunge_character_state_component.lunge_target

	if lunge_target then
		local lunge_target_position = POSITION_LOOKUP[lunge_target]
		local unit_position = POSITION_LOOKUP[unit]
		local remianing_distance_to_target = Vector3.distance_squared(unit_position, lunge_target_position)

		if remianing_distance_to_target < 2 then
			return false
		end

		direction = Vector3.flat(Vector3.normalize(lunge_target_position - unit_position))
	elseif lunge_template.allow_steering then
		local target_rotation = locomotion_steering_component.target_rotation
		direction = Quaternion.forward(target_rotation)
	end

	locomotion_steering_component.velocity_wanted = direction * speed
	local move_delta = speed * dt
	lunge_character_state_component.distance_left = math.max(lunge_character_state_component.distance_left - move_delta, 0)

	return true
end

PlayerCharacterStateLunging._update_enemy_hit_detection = function (self, unit, lunge_template)
	local side_system = Managers.state.extension:system("side_system")
	local damage_settings = lunge_template.damage_settings
	local damage_profile = damage_settings.damage_profile
	local damage_type = damage_settings.damage_type
	local locomotion_component = self._locomotion_component
	local locomotion_position = PlayerMovement.locomotion_position(locomotion_component)
	local use_armor_type = not not lunge_template.stop_armor_types
	local rewind_ms = LagCompensation.rewind_ms(self._is_server, self._is_local_unit, self._player)
	local radius = damage_settings.radius

	PhysicsProximitySystem.prepare_for_overlap(self._physics_world, locomotion_position, radius)

	local actors, num_actors = PhysicsWorld.immediate_overlap(self._physics_world, "shape", "sphere", "position", locomotion_position, "size", radius, "collision_filter", DAMAGE_COLLISION_FILTER, "rewind_ms", rewind_ms)
	local character_state_hit_mass_component = self._character_state_hit_mass_component
	local max_hit_mass = _max_hit_mass(damage_settings, lunge_template)
	local used_hit_mass_percentage = character_state_hit_mass_component.used_hit_mass_percentage
	local current_mass_hit = math.huge <= max_hit_mass and 0 or max_hit_mass * used_hit_mass_percentage
	local have_hit_stop_armor = false
	local fp_position = self._first_person_component.position
	local lunge_direction = self._lunge_character_state_component.direction
	local lunge_dir_right = Vector3.cross(lunge_direction, Vector3.up())
	local forward = Vector3.forward()
	local right = Vector3.right()
	local lunge_rotation = Quaternion.look(lunge_direction)
	local left_attack_direction = Quaternion.rotate(lunge_rotation, Vector3.normalize(forward - right))
	local right_attack_direction = Quaternion.rotate(lunge_rotation, Vector3.normalize(forward + right))
	local hit_enemy_units = self._hit_enemy_units

	for i = 1, num_actors do
		local hit_actor = actors[i]
		local hit_unit = Actor.unit(hit_actor)

		if side_system:is_enemy(unit, hit_unit) and not hit_enemy_units[hit_unit] then
			hit_enemy_units[hit_unit] = true
			self._last_hit_unit = hit_unit
			local hit_position = POSITION_LOOKUP[hit_unit]
			local hit_direction = Vector3.normalize(Vector3.flat(hit_position - fp_position))
			local attack_direction = nil
			local dot = Vector3.dot(hit_direction, lunge_dir_right)

			if dot > 0 then
				attack_direction = right_attack_direction
			else
				attack_direction = left_attack_direction
			end

			local hit_world_position = Actor.position(hit_actor)
			local damage_dealt, attack_result, damage_efficiency = Attack.execute(hit_unit, damage_profile, "power_level", 1000, "hit_world_position", hit_world_position, "attack_direction", attack_direction, "attack_type", AttackSettings.attack_types.melee, "attacking_unit", unit, "damage_type", damage_type)

			ImpactEffect.play(hit_unit, hit_actor, damage_dealt, damage_type, nil, attack_result, hit_world_position, nil, attack_direction, unit, nil, nil, nil, damage_efficiency, damage_profile)

			current_mass_hit = current_mass_hit + HitMass.target_hit_mass(hit_unit)

			if use_armor_type then
				local hit_unit_data_extension = ScriptUnit.extension(hit_unit, "unit_data_system")
				local hit_unit_breed = hit_unit_data_extension:breed()
				local armor_type = Armor.armor_type(unit, hit_unit_breed)
				local stop_armor_types = lunge_template.stop_armor_types

				for i = 1, #stop_armor_types do
					if armor_type == stop_armor_types[i] then
						have_hit_stop_armor = true

						break
					end
				end
			end
		end
	end

	character_state_hit_mass_component.used_hit_mass_percentage = math.clamp(max_hit_mass > 0 and current_mass_hit / max_hit_mass or 0, 0, 1)
	local max_hit_mass_reached = max_hit_mass <= current_mass_hit

	return have_hit_stop_armor
end

PlayerCharacterStateLunging._update_timing_anims = function (self, timing_anims, time_in_lunge)
	local played_timing_anims = self._played_timing_anims
	local anim_extension = self._animation_extension

	for time, anim in pairs(timing_anims) do
		local time_to_play = time <= time_in_lunge
		local already_played = played_timing_anims[time]

		if time_to_play and not already_played then
			played_timing_anims[time] = true

			self:_play_animation(anim_extension, anim)
		end
	end
end

local NO_LERP_VALUES = {}

function _max_hit_mass(damage_settings, lunge_template)
	local charge_level = 1
	local damage_profile = damage_settings.damage_profile
	local critical_strike = false
	local power_level = lunge_template.lunge_power_level or DEFUALT_POWER_LEVEL
	local max_hit_mass_attack, max_hit_mass_impact = DamageProfile.max_hit_mass(damage_profile, power_level, charge_level, NO_LERP_VALUES, critical_strike)
	local max_hit_mass = math.max(max_hit_mass_attack, max_hit_mass_impact)

	return max_hit_mass
end

return PlayerCharacterStateLunging