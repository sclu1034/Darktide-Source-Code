local AttackSettings = require("scripts/settings/damage/attack_settings")
local Breed = require("scripts/utilities/breed")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local FriendlyFire = require("scripts/utilities/attack/friendly_fire")
local ToughnessDepleted = require("scripts/utilities/toughness/toughness_depleted")
local ToughnessSettings = require("scripts/settings/toughness/toughness_settings")
local attack_results = AttackSettings.attack_results
local health_settings = AttackSettings.health_settings
local shield_settings = AttackSettings.shield_settings
local toughness_template_types = ToughnessSettings.template_types
local buff_keywords = BuffSettings.keywords
local _calculate_shield_damage, _calculate_tougness_damage, _calculate_tougness_damage_player, _calculate_tougness_damage_minion, _calculate_health_damage, _calculate_health_damage_player, _calculate_health_damage_minion = nil
local DamageTakenCalculation = {
	get_calculation_parameters = function (attacked_unit, attacked_breed_or_nil, damage_profile, attacking_unit, attacking_unit_owner_unit, hit_actor)
		local side_system = Managers.state.extension:system("side_system")
		local is_ally = side_system:is_ally(attacked_unit, attacking_unit_owner_unit)
		local damage_allowed = not is_ally or FriendlyFire.is_enabled(attacking_unit_owner_unit, attacked_unit) or damage_profile.override_allow_friendly_fire
		local is_minion = Breed.is_minion(attacked_breed_or_nil)
		local is_player = Breed.is_player(attacked_breed_or_nil)
		local health_setting = is_player and health_settings.player or is_minion and health_settings.minion
		local health_extension = ScriptUnit.extension(attacked_unit, "health_system")
		local is_invulnerable = health_extension:is_invulnerable()
		local current_health_damage = health_extension:damage_taken()
		local current_permanent_damage = health_extension:permanent_damage_taken()
		local max_health = health_extension:max_health()
		local toughness_exension = ScriptUnit.has_extension(attacked_unit, "toughness_system")
		local toughness_template, weapon_toughness_template = nil

		if toughness_exension then
			toughness_template, weapon_toughness_template = toughness_exension:toughness_templates()
		end

		local current_toughness_damage = toughness_exension and toughness_exension:toughness_damage() or 0
		local movement_state = nil

		if is_player then
			local unit_data_extension = ScriptUnit.extension(attacked_unit, "unit_data_system")
			local movement_state_component = unit_data_extension:read_component("movement_state")
			movement_state = movement_state_component and movement_state_component.method
		end

		local shield_extension = ScriptUnit.has_extension(attacked_unit, "shield_system")
		local shield_setting = nil

		if shield_extension then
			local can_shield_block = shield_extension:can_block_attack(damage_profile, attacking_unit, attacking_unit_owner_unit, hit_actor)
			shield_setting = can_shield_block and shield_settings.block_all
		end

		local buff_extension = ScriptUnit.has_extension(attacked_unit, "buff_system")
		local attacked_unit_stat_buffs = buff_extension and buff_extension:stat_buffs()
		local attacked_unit_keywords = buff_extension and buff_extension:keywords()

		return is_invulnerable, damage_allowed, health_setting, current_health_damage, current_permanent_damage, max_health, toughness_template, weapon_toughness_template, current_toughness_damage, movement_state, shield_setting, attacked_unit_stat_buffs, attacked_unit_keywords
	end,
	calculate_attack_result = function (damage_amount, damage_profile, attack_type, attack_direction, instakill, is_invulnerable, damage_allowed, health_setting, current_health_damage, current_permanent_damage, max_health, toughness_template, weapon_toughness_template, current_toughness_damage, movement_state, shield_setting, attacked_unit_stat_buffs, attacked_unit_keywords)
		if not damage_allowed then
			return attack_results.friendly_fire, 0, 0, 0, damage_amount
		end

		local remaining_damage = damage_amount
		local remaining_permanent_damage = 0
		local damage_absorbed = 0
		local tougness_damage = 0
		local attack_result, shield_attack_result, shield_damage_absorbed = nil
		shield_attack_result, remaining_damage, shield_damage_absorbed = _calculate_shield_damage(remaining_damage, damage_profile, shield_setting, instakill)
		damage_absorbed = damage_absorbed + shield_damage_absorbed

		if shield_attack_result then
			attack_result = shield_attack_result
		end

		if remaining_damage > 0 then
			local thougness_attack_result, thougness_damage_absorbed = nil
			thougness_attack_result, remaining_damage, tougness_damage, thougness_damage_absorbed = _calculate_tougness_damage(remaining_damage, damage_profile, attack_type, attack_direction, toughness_template, weapon_toughness_template, current_toughness_damage, movement_state, attacked_unit_stat_buffs, instakill)
			damage_absorbed = damage_absorbed + thougness_damage_absorbed

			if thougness_attack_result then
				attack_result = attack_result or thougness_attack_result
			end
		end

		if remaining_damage > 0 then
			local health_attack_result = nil
			health_attack_result, remaining_damage, remaining_permanent_damage = _calculate_health_damage(remaining_damage, damage_profile, current_health_damage, current_permanent_damage, max_health, instakill, is_invulnerable, attacked_unit_stat_buffs, attacked_unit_keywords, health_setting)

			if health_attack_result then
				attack_result = attack_result or health_attack_result
			end
		end

		attack_result = attack_result or attack_results.damaged

		return attack_result, remaining_damage, remaining_permanent_damage, tougness_damage, damage_absorbed
	end
}

function _calculate_shield_damage(damage_amount, damage_profile, shield_setting, instakill)
	local ignore_shield = damage_profile.ignore_shield or instakill
	local block_damage = shield_setting == shield_settings.block_all

	if not ignore_shield and block_damage then
		return attack_results.shield_blocked, 0, damage_amount
	end

	return nil, damage_amount, 0
end

function _calculate_tougness_damage(damage_amount, damage_profile, attack_type, attack_direction, toughness_template, weapon_toughness_template, current_toughness_damage, movement_state, attacked_unit_stat_buffs, instakill)
	local ignore_toughness = damage_profile.ignore_toughness or instakill

	if not ignore_toughness then
		local toughness_template_type = toughness_template and toughness_template.template_type

		if toughness_template_type == toughness_template_types.player then
			return _calculate_tougness_damage_player(damage_amount, damage_profile, attack_type, attack_direction, toughness_template, weapon_toughness_template, current_toughness_damage, movement_state, attacked_unit_stat_buffs, instakill)
		elseif toughness_template_type == toughness_template_types.minion then
			return _calculate_tougness_damage_minion(damage_amount, damage_profile, attack_type, attack_direction, toughness_template, current_toughness_damage, attacked_unit_stat_buffs, instakill)
		end
	end

	return nil, damage_amount, 0, 0
end

function _calculate_tougness_damage_player(damage_amount, damage_profile, attack_type, attack_direction, toughness_template, weapon_toughness_template, current_toughness_damage, movement_state, attacked_unit_stat_buffs, instakill)
	local toughness_extra = attacked_unit_stat_buffs.toughness or 0
	local max_toughness = toughness_template.max + toughness_extra
	local toughness_before_damage = max_toughness - current_toughness_damage

	if max_toughness <= current_toughness_damage then
		return nil, damage_amount, 0, 0
	end

	local melee_attack = attack_type == "melee"
	local ranged_attack = attack_type == "ranged"
	local remaining_damage, toughness_damage, absorbed_attack, toughness_broken = nil
	local toughness_melee_damage_modifier = weapon_toughness_template and weapon_toughness_template.melee_damage_modifier or toughness_template.melee_damage_modifier or 1

	if melee_attack then
		local toughness_melee_spillover_modifier = toughness_template.melee_spillover_modifier or 1
		local current_toughness_percent = 1 - current_toughness_damage / max_toughness or 0
		remaining_damage = math.lerp(damage_amount, 0, current_toughness_percent) * toughness_melee_spillover_modifier
		toughness_damage = math.clamp(max_toughness * toughness_melee_damage_modifier, 0, max_toughness)
		absorbed_attack = max_toughness > current_toughness_damage + toughness_damage
	else
		if not ranged_attack then
			toughness_damage = max_toughness
		else
			local damage_modifier = toughness_template.state_damage_modifiers[movement_state] or 1
			local toughness_multiplier = damage_profile.toughness_multiplier or 1
			local weapon_toughness_multiplier = weapon_toughness_template and weapon_toughness_template.toughness_damage_modifier or 1
			damage_modifier = damage_modifier + toughness_multiplier * weapon_toughness_multiplier - 1
			local buff_toughness_damage_taken_multiplier = attacked_unit_stat_buffs and attacked_unit_stat_buffs.toughness_damage_taken_multiplier or 1
			local buff_toughness_damage_taken_modifier = attacked_unit_stat_buffs and attacked_unit_stat_buffs.toughness_damage_taken_modifier or 1
			local damage_buff_multiplier = buff_toughness_damage_taken_multiplier * buff_toughness_damage_taken_modifier
			damage_modifier = damage_modifier * damage_buff_multiplier
			toughness_damage = math.clamp(damage_amount * damage_modifier, 0, max_toughness)
		end

		absorbed_attack = max_toughness > current_toughness_damage + toughness_damage
		toughness_broken = not absorbed_attack and toughness_before_damage > 0

		if toughness_broken then
			if damage_profile.on_depleted_toughness_function_override_name then
				local toughness_depleted_func = ToughnessDepleted[damage_profile.on_depleted_toughness_function_override_name]
				remaining_damage = toughness_depleted_func(current_toughness_damage, max_toughness, damage_amount)
			elseif weapon_toughness_template and weapon_toughness_template.optional_on_depleted_function_name_override then
				local toughness_depleted_func = ToughnessDepleted[weapon_toughness_template.optional_on_depleted_function_name_override]
				remaining_damage = toughness_depleted_func(current_toughness_damage, max_toughness, damage_amount)
			else
				remaining_damage = toughness_template.on_depleted_function(current_toughness_damage, max_toughness, damage_amount)
			end
		else
			remaining_damage = 0
		end
	end

	local attack_result = absorbed_attack and attack_results.toughness_absorbed or toughness_broken and attack_results.toughness_broken
	local absorbed_damage = damage_amount - remaining_damage

	return attack_result, remaining_damage, toughness_damage, absorbed_damage
end

function _calculate_tougness_damage_minion(damage_amount, damage_profile, attack_type, attack_direction, toughness_template, current_toughness_damage, attacked_unit_stat_buffs, instakill)
	local max_toughness = Managers.state.difficulty:get_table_entry_by_challenge(toughness_template.max)

	if max_toughness <= current_toughness_damage then
		return nil, damage_amount, 0, 0
	end

	local max_hit_percent = toughness_template.max_hit_percent
	local clamped_damage_ammount = damage_amount

	if max_hit_percent then
		local max_damage = math.round(max_toughness * max_hit_percent)
		clamped_damage_ammount = math.min(max_damage, damage_amount)
	end

	local absorbed_attack = max_toughness > current_toughness_damage + damage_amount
	local attack_result = absorbed_attack and attack_results.toughness_absorbed

	return attack_result, 0, clamped_damage_ammount, damage_amount
end

function _calculate_health_damage(damage_amount, damage_profile, current_health_damage, current_permanent_damage, max_health, instakill, is_invulnerable, attacked_unit_stat_buffs, attacked_unit_keywords, health_setting)
	if health_setting == health_settings.player then
		return _calculate_health_damage_player(damage_amount, damage_profile, current_health_damage, current_permanent_damage, max_health, instakill, is_invulnerable, attacked_unit_stat_buffs, attacked_unit_keywords)
	elseif health_setting == health_settings.minion then
		return _calculate_health_damage_minion(damage_amount, damage_profile, current_health_damage, current_permanent_damage, max_health, instakill, is_invulnerable, attacked_unit_stat_buffs, attacked_unit_keywords)
	end

	return attack_results.damaged, damage_amount, 0
end

function _calculate_health_damage_player(damage_amount, damage_profile, current_health_damage, current_permanent_damage, max_health, instakill, is_invulnerable, attacked_unit_stat_buffs, attacked_unit_keywords)
	if is_invulnerable then
		return attack_results.damaged, 0, 0
	end

	local permanent_damage_profile_ratio = damage_profile and damage_profile.permanent_damage_ratio or 0
	local permanent_damage_buff_ratio = attacked_unit_stat_buffs and attacked_unit_stat_buffs.permanent_damage_taken or 0
	local permanent_damage_buff_resistance = attacked_unit_stat_buffs and attacked_unit_stat_buffs.permanent_damage_converter_resistance or 0
	local permanent_damage_ratio = math.clamp(permanent_damage_profile_ratio + permanent_damage_buff_ratio * (1 - permanent_damage_buff_resistance), 0, 1)
	local buff_corruption_taken_multiplier = attacked_unit_stat_buffs and attacked_unit_stat_buffs.corruption_taken_multiplier or 1
	buff_corruption_taken_multiplier = math.max(0, buff_corruption_taken_multiplier)
	local permanent_damage = damage_amount * permanent_damage_ratio * buff_corruption_taken_multiplier
	local health_damage = damage_amount * (1 - permanent_damage_ratio)

	if max_health - (current_permanent_damage + permanent_damage) < 1 then
		permanent_damage = math.max(0, max_health - current_permanent_damage - 1)
	end

	if current_health_damage < current_permanent_damage + permanent_damage then
		health_damage = health_damage + current_permanent_damage + permanent_damage - current_health_damage
	end

	local remaining_health = max_health - current_health_damage - health_damage
	local will_die = remaining_health <= 0
	local attack_result = will_die and attack_results.knock_down or attack_results.damaged
	local has_resist_death_buff = attacked_unit_keywords and attacked_unit_keywords[buff_keywords.resist_death]

	if will_die and has_resist_death_buff and not instakill then
		health_damage = math.max(0, max_health - current_health_damage - 1)
		attack_result = attack_results.damaged
	end

	return attack_result, health_damage, permanent_damage
end

function _calculate_health_damage_minion(damage_amount, damage_profile, current_health_damage, current_permanent_damage, max_health, instakill, is_invulnerable, attacked_unit_stat_buffs, attacked_unit_keywords)
	if is_invulnerable then
		return attack_results.damaged, 0, 0
	end

	local remaining_health = max_health - current_health_damage - damage_amount
	local will_die = remaining_health <= 0
	local attack_result = will_die and attack_results.died or attack_results.damaged

	return attack_result, damage_amount, 0
end

return DamageTakenCalculation