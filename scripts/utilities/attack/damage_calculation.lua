local AttackSettings = require("scripts/settings/damage/attack_settings")
local Breed = require("scripts/utilities/breed")
local DamageProfile = require("scripts/utilities/attack/damage_profile")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local PowerLevel = require("scripts/utilities/attack/power_level")
local PowerLevelSettings = require("scripts/settings/damage/power_level_settings")
local Weakspot = require("scripts/utilities/attack/weakspot")
local armor_damage_modifier_to_damage_efficiency = AttackSettings.armor_damage_modifier_to_damage_efficiency
local attack_types = AttackSettings.attack_types
local damage_types = DamageSettings.damage_types
local melee_attack_strengths = AttackSettings.melee_attack_strength
local DamageCalculation = {}
local _apply_armor_type_buffs_to_damage, _apply_damage_type_buffs_to_damage, _backstab_damage, _base_damage, _base_power_boost_damage, _boost_curve_multiplier, _calculate_damage_buff, _finesse_boost_damage, _hit_zone_damage_multiplier, _power_boost_damage, _power_level_scaled_damage = nil
local EMPTY_STAT_BUFFS = {}

DamageCalculation.calculate = function (damage_profile, target_settings, lerp_values, hit_zone_name, power_level, charge_level, breed_or_nil, attacker_breed_or_nil, is_critical_strike, is_backstab, dropoff_scalar, has_power_boost, attack_type, attacker_stat_buffs, target_stat_buffs, armor_penetrating, target_toughness_extension, armor_type, stagger_count, num_triggered_staggers, is_attacked_unit_suppressed, distance, target_unit, attacking_unit, auto_completed_action)
	attacker_stat_buffs = attacker_stat_buffs or EMPTY_STAT_BUFFS
	target_stat_buffs = target_stat_buffs or EMPTY_STAT_BUFFS
	local power_level_modifier_stat_buff = attacker_stat_buffs.power_level_modifier or 1
	power_level = power_level * power_level_modifier_stat_buff
	local blackboard = BLACKBOARDS[target_unit]

	if target_settings.power_level_multiplier then
		local power_level_lerp_value = DamageProfile.lerp_value_from_path(lerp_values, "targets", 1, "power_level_multiplier")
		local power_level_multiplier = DamageProfile.lerp_damage_profile_entry(target_settings.power_level_multiplier, power_level_lerp_value)
		power_level = power_level * power_level_multiplier
	end

	local base_damage, base_buff_damage = _base_damage(damage_profile, target_settings, power_level, charge_level, armor_type, is_critical_strike, dropoff_scalar, attack_type, attacker_stat_buffs, target_stat_buffs, lerp_values, num_triggered_staggers, is_attacked_unit_suppressed, breed_or_nil, attacker_breed_or_nil, distance, auto_completed_action, blackboard)
	local power_boost_damage = 0
	local finesse_boost_damage = 0
	local attacker_buff_extension = ScriptUnit.has_extension(attacking_unit, "buff_system")
	local hit_weakspot = Weakspot.hit_weakspot(breed_or_nil, hit_zone_name, attack_type, attacker_buff_extension)
	local is_finesse_hit = is_critical_strike or hit_weakspot
	local do_additional_damage_calculations = has_power_boost or is_finesse_hit

	if do_additional_damage_calculations then
		local base_power_boost_damage = _base_power_boost_damage(damage_profile, target_settings, power_level, charge_level, armor_type, is_critical_strike, dropoff_scalar, attack_type, attacker_stat_buffs, lerp_values)
		local boost_curve = target_settings.boost_curve or PowerLevelSettings.boost_curves.default

		if has_power_boost then
			power_boost_damage = _power_boost_damage(base_damage + base_buff_damage, base_power_boost_damage, damage_profile, target_settings, armor_type, boost_curve, lerp_values)
		end

		if is_finesse_hit then
			finesse_boost_damage = _finesse_boost_damage(base_damage + base_buff_damage, base_power_boost_damage, power_boost_damage, damage_profile, target_settings, breed_or_nil, hit_zone_name, armor_type, is_critical_strike, hit_weakspot, boost_curve, attack_type, attacker_stat_buffs, stagger_count, lerp_values)
		end
	end

	local backstab_damage = _backstab_damage(base_damage, attack_type, attacker_stat_buffs, is_backstab)
	local armor_damage_modifier = DamageProfile.armor_damage_modifier("attack", damage_profile, target_settings, lerp_values, armor_type, is_critical_strike, dropoff_scalar, armor_penetrating)
	local damage = base_damage + base_buff_damage + power_boost_damage + finesse_boost_damage + backstab_damage
	damage = damage * armor_damage_modifier
	local hit_zone_damage_multiplier = _hit_zone_damage_multiplier(breed_or_nil, hit_zone_name, attack_type, damage_profile.ignore_hitzone_multiplier)
	damage = damage * hit_zone_damage_multiplier
	damage = _apply_armor_type_buffs_to_damage(damage, armor_type, attacker_stat_buffs, target_toughness_extension)
	damage = _apply_armor_type_buffs_to_damage(damage, armor_type, target_stat_buffs, target_toughness_extension)
	local is_push = damage_profile.is_push or armor_type ~= "super_armor" and armor_damage_modifier == 0
	local damage_efficiency = is_push and "push" or armor_damage_modifier_to_damage_efficiency(armor_damage_modifier, armor_type)

	return damage, damage_efficiency
end

function _apply_damage_type_buffs_to_damage(damage, attack_type, stat_buffs)
	if attack_type == attack_types.melee then
		local melee_damage_stat_buff = stat_buffs.melee_damage or 1
		damage = damage * melee_damage_stat_buff
	end

	return damage
end

function _apply_armor_type_buffs_to_damage(base_damage, armor_type, stat_buffs, target_toughness_extension)
	local damage = base_damage

	if stat_buffs then
		if armor_type == "unarmored" and stat_buffs.unarmored_damage then
			damage = damage * stat_buffs.unarmored_damage
		elseif armor_type == "armored" and stat_buffs.armored_damage then
			damage = damage * stat_buffs.armored_damage
		elseif armor_type == "resistant" and stat_buffs.resistant_damage then
			damage = damage * stat_buffs.resistant_damage
		elseif armor_type == "berserker" and stat_buffs.berserker_damage then
			damage = damage * stat_buffs.berserker_damage
		elseif armor_type == "super_armor" and stat_buffs.super_armor_damage then
			damage = damage * stat_buffs.super_armor_damage
		elseif armor_type == "disgustingly_resilient" and stat_buffs.disgustingly_resilient_damage then
			damage = damage * stat_buffs.disgustingly_resilient_damage
		end

		if stat_buffs.toughness_damage and target_toughness_extension and target_toughness_extension:current_toughness_percent() > 0 then
			damage = damage * stat_buffs.toughness_damage
		end
	end

	return damage
end

function _boost_curve_multiplier(curve, percent)
	local num_points = #curve
	local curve_t = (num_points - 1) * percent
	local curve_index = math.floor(curve_t) + 1
	local p0 = curve[curve_index]
	local p1 = curve[math.min(curve_index + 1, num_points)]
	local local_t = curve_t - math.floor(curve_t)

	return p0 * (1 - local_t) + p1 * local_t
end

function _power_level_scaled_damage(damage_profile, target_settings, power_level, charge_level, armor_type, is_critical_strike, dropoff_scalar, lerp_values)
	local dmg_table = PowerLevelSettings.damage_output[armor_type]
	local dmg_min = dmg_table.min
	local dmg_max = dmg_table.max
	local dmg_range = dmg_max - dmg_min
	local scaled_power_level = PowerLevel.scale_by_charge_level(power_level, charge_level)
	local attack_power_level = DamageProfile.power_distribution_from_power_level(scaled_power_level, "attack", damage_profile, target_settings, is_critical_strike, dropoff_scalar, armor_type, lerp_values)
	local percentage = PowerLevel.power_level_percentage(attack_power_level)

	return dmg_min + dmg_range * percentage
end

function _calculate_damage_buff(damage_profile, target_settings, power_level, charge_level, armor_type, is_critical_strike, dropoff_scalar, attack_type, attacker_stat_buffs, target_stat_buffs, lerp_values, num_triggered_staggers, is_attacked_unit_suppressed, attacked_breed_or_nil, attacker_breed_or_nil, distance, auto_completed_action, blackboard)
	local is_player = Breed.is_player(attacked_breed_or_nil)
	local damage_type = damage_profile.damage_type
	local damage_stat_buffs = 1
	local damage_stat_buff = (attacker_stat_buffs.damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + damage_stat_buff
	local close_damage_buff = attacker_stat_buffs.damage_near or 1
	local far_damage_buff = attacker_stat_buffs.damage_far or 1
	local distance_damage_buff = (dropoff_scalar and math.lerp(close_damage_buff, far_damage_buff, math.sqrt(dropoff_scalar)) or 1) - 1
	damage_stat_buffs = damage_stat_buffs + distance_damage_buff
	local is_melee_attack = attack_type == attack_types.melee
	local melee_damage_stat_buff = (is_melee_attack and attacker_stat_buffs.melee_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + melee_damage_stat_buff
	local is_heavy_melee_attack = is_melee_attack and damage_profile.melee_attack_strength == melee_attack_strengths.heavy
	local melee_heavy_damage_stat_buff = (is_heavy_melee_attack and attacker_stat_buffs.melee_heavy_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + melee_heavy_damage_stat_buff
	local is_fully_charged_heavy_attack = auto_completed_action and is_heavy_melee_attack
	local fully_charged_heavy_attack_damage_stat_buff = (is_fully_charged_heavy_attack and attacker_stat_buffs.melee_fully_charged_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + fully_charged_heavy_attack_damage_stat_buff
	local is_ranged_attack = attack_type == attack_types.ranged
	local ranged_damage_stat_buff = (is_ranged_attack and attacker_stat_buffs.ranged_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + ranged_damage_stat_buff
	local fully_charged = charge_level == 1
	local fully_charged_stat_buff = (fully_charged and attacker_stat_buffs.fully_charged_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + fully_charged_stat_buff
	local is_target_elite = attacked_breed_or_nil and attacked_breed_or_nil.tags and attacked_breed_or_nil.tags.elite
	local vs_elites_damage_stat_buff = (is_target_elite and attacker_stat_buffs.damage_vs_elites or 1) - 1
	damage_stat_buffs = damage_stat_buffs + vs_elites_damage_stat_buff
	local is_target_special = attacked_breed_or_nil and attacked_breed_or_nil.tags and attacked_breed_or_nil.tags.special
	local damage_vs_specials_stat_buff = (is_target_special and attacker_stat_buffs.damage_vs_specials or 1) - 1
	damage_stat_buffs = damage_stat_buffs + damage_vs_specials_stat_buff
	local is_horde = attacked_breed_or_nil and attacked_breed_or_nil.tags and attacked_breed_or_nil.tags.horde
	local vs_horde_buff = (is_horde and attacker_stat_buffs.damage_vs_horde or 1) - 1
	damage_stat_buffs = damage_stat_buffs + vs_horde_buff
	local target_is_ogryn = attacked_breed_or_nil and attacked_breed_or_nil.tags and attacked_breed_or_nil.tags.ogryn
	local damage_vs_ogryn_stat_buff = (target_is_ogryn and attacker_stat_buffs.damage_vs_ogryn or 1) - 1
	damage_stat_buffs = damage_stat_buffs + damage_vs_ogryn_stat_buff
	local target_unaggroed = nil

	if blackboard and not is_player then
		local perception_component = blackboard.perception
		local aggro_state = perception_component.aggro_state
		local is_unaggroed = aggro_state ~= "aggroed"
		target_unaggroed = is_unaggroed
	end

	local damage_vs_unaggroed_stat_buff = (target_unaggroed and attacker_stat_buffs.damage_vs_unaggroed or 1) - 1
	damage_stat_buffs = damage_stat_buffs + damage_vs_unaggroed_stat_buff
	local suppresed_damage_stat_buff = (is_attacked_unit_suppressed and attacker_stat_buffs.damage_vs_suppressed or 1) - 1
	damage_stat_buffs = damage_stat_buffs + suppresed_damage_stat_buff
	local target_is_staggered = num_triggered_staggers > 0
	local damage_vs_staggered__stat_buff = (target_is_staggered and attacker_stat_buffs.damage_vs_staggered_ or 1) - 1
	damage_stat_buffs = damage_stat_buffs + damage_vs_staggered__stat_buff
	local force_staff_single_target = damage_type == damage_types.force_staff_single_target
	local force_staff_single_target_damage_stat_buff = (force_staff_single_target and attacker_stat_buffs.force_staff_single_target_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + force_staff_single_target_damage_stat_buff
	local is_shout_attack = attack_type == attack_types.shout
	local shout_damage_stat_buff = (is_shout_attack and attacker_stat_buffs.shout_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + shout_damage_stat_buff
	local is_smite_attack = damage_type == damage_types.smite
	local smite_damage_stat_buff = (is_smite_attack and attacker_stat_buffs.smite_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + smite_damage_stat_buff
	local is_chain_lightning = damage_profile.chain_lightning
	local chain_lightning_damage_stat_buff = (is_chain_lightning and attacker_stat_buffs.chain_lightning_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + chain_lightning_damage_stat_buff
	local is_warp_attack = damage_type == damage_types.warp
	local warp_damage_stat_buff = (is_warp_attack and attacker_stat_buffs.warp_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + warp_damage_stat_buff
	local finesse_ability_multiplier = damage_profile.finesse_ability_damage_multiplier
	local finesse_ability_multiplier_stat_buff = (finesse_ability_multiplier and attacker_stat_buffs.finesse_ability_multiplier or 1) - 1
	damage_stat_buffs = damage_stat_buffs + finesse_ability_multiplier_stat_buff
	local is_krak_attack = damage_type == damage_types.krak
	local krak_damage_stat_buff = (is_krak_attack and attacker_stat_buffs.krak_damage or 1) - 1
	damage_stat_buffs = damage_stat_buffs + krak_damage_stat_buff

	return damage_stat_buffs
end

function _base_damage(damage_profile, target_settings, power_level, charge_level, armor_type, is_critical_strike, dropoff_scalar, attack_type, attacker_stat_buffs, target_stat_buffs, lerp_values, num_triggered_staggers, is_attacked_unit_suppressed, attacked_breed_or_nil, attacker_breed_or_nil, distance, auto_completed_action, blackboard)
	local base_damage = _power_level_scaled_damage(damage_profile, target_settings, power_level, charge_level, armor_type, is_critical_strike, dropoff_scalar, lerp_values)
	local damage_stat_buffs = _calculate_damage_buff(damage_profile, target_settings, power_level, charge_level, armor_type, is_critical_strike, dropoff_scalar, attack_type, attacker_stat_buffs, target_stat_buffs, lerp_values, num_triggered_staggers, is_attacked_unit_suppressed, attacked_breed_or_nil, attacker_breed_or_nil, distance, auto_completed_action, blackboard)
	local damage_taken_multiplier = target_stat_buffs and target_stat_buffs.damage_taken_multiplier or 1
	local is_ranged_attack = attack_type == attack_types.ranged
	local ranged_damage_taken_multiplier = is_ranged_attack and target_stat_buffs and target_stat_buffs.ranged_damage_taken_multiplier or 1
	local attacker_is_ogryn = attacker_breed_or_nil and attacker_breed_or_nil.tags and attacker_breed_or_nil.tags.ogryn
	local ogryn_damage_taken_multiplier = attacker_is_ogryn and target_stat_buffs and target_stat_buffs.ogryn_damage_taken_multiplier or 1
	local damage_taken_stat_buffs = damage_taken_multiplier * ranged_damage_taken_multiplier * ogryn_damage_taken_multiplier

	return base_damage, base_damage * damage_stat_buffs * damage_taken_stat_buffs - base_damage
end

function _base_power_boost_damage(damage_profile, target_settings, power_level, charge_level, armor_type, is_critical_strike, dropoff_scalar, attack_type, stat_buffs, lerp_values)
	local power_boost_armor = PowerLevelSettings.power_boost_armor[armor_type]
	local damage = _power_level_scaled_damage(damage_profile, target_settings, power_level, charge_level, power_boost_armor, is_critical_strike, dropoff_scalar, lerp_values)
	damage = _apply_damage_type_buffs_to_damage(damage, attack_type, stat_buffs)

	return damage
end

function _power_boost_damage(base_damage, base_power_boost_damage, damage_profile, target_settings, armor_type, boost_curve, lerp_values)
	local power_boost_min_damage = 1
	local power_boost_amount = PowerLevelSettings.power_boost_amount[armor_type]
	local power_damage = nil
	local use_boost_curve = boost_curve and power_boost_amount > 0

	if use_boost_curve then
		local boost_curve_multiplier = DamageProfile.boost_curve_multiplier(target_settings, "boost_curve_multiplier", lerp_values)
		local boost_multiplier = _boost_curve_multiplier(boost_curve, power_boost_amount) * boost_curve_multiplier
		power_damage = math.max(math.max(base_power_boost_damage, base_damage), power_boost_min_damage) * boost_multiplier
	else
		power_damage = base_power_boost_damage
	end

	return power_damage
end

function _finesse_boost_damage(base_damage, base_power_boost_damage, power_boost_damage, damage_profile, target_settings, breed_or_nil, hit_zone_name, armor_type, is_critical_strike, hit_weakspot, boost_curve, attack_type, stat_buffs, stagger_count, lerp_values)
	local finesse_boost_amount = 0
	local use_finesse_boost = not damage_profile.no_finesse_boost and hit_weakspot

	if use_finesse_boost then
		if base_damage > 0 then
			local boost_table = target_settings.finesse_boost
			finesse_boost_amount = finesse_boost_amount + (boost_table and boost_table[armor_type] or PowerLevelSettings.default_finesse_boost_amount[armor_type])
		else
			local boost_table = target_settings.finesse_boost_no_base_damage
			finesse_boost_amount = finesse_boost_amount + (boost_table and boost_table[armor_type] or PowerLevelSettings.default_finesse_boost_no_base_damage_amount[armor_type])
		end

		finesse_boost_amount = Weakspot.finesse_boost_modifer(breed_or_nil, hit_zone_name, finesse_boost_amount)
	end

	local use_crit_boost = not damage_profile.no_crit_boost and is_critical_strike

	if use_crit_boost then
		local crit_boost_amount = damage_profile.crit_boost or PowerLevelSettings.default_crit_boost_amount
		finesse_boost_amount = finesse_boost_amount + crit_boost_amount
	end

	local finesse_damage = nil
	local finesse_min_damage = base_power_boost_damage * PowerLevelSettings.finesse_min_damage_multiplier
	local use_boost_curve = boost_curve and finesse_boost_amount > 0

	if use_boost_curve then
		finesse_boost_amount = math.min(finesse_boost_amount, 1)
		local boost_curve_multiplier_finesse = DamageProfile.boost_curve_multiplier(target_settings, "boost_curve_multiplier_finesse", lerp_values)
		local finesse_boost_multiplier = _boost_curve_multiplier(boost_curve, finesse_boost_amount) * boost_curve_multiplier_finesse
		finesse_damage = math.max(math.max(power_boost_damage, base_damage), finesse_min_damage) * finesse_boost_multiplier
	else
		finesse_damage = finesse_min_damage
	end

	local is_ranged = attack_type == attack_types.ranged
	local is_melee = attack_type == attack_types.melee
	local weakspot_damage_stat_buff = 1

	if hit_weakspot then
		local weakspot_damage = stat_buffs.weakspot_damage or 1
		local ranged_weakspot_damage = is_ranged and stat_buffs.ranged_weakspot_damage or 1
		local melee_weakspot_damage = is_melee and stat_buffs.melee_weakspot_damage or 1
		local ranged_weakspot_damage_vs_staggered_ = 1

		if is_ranged and stagger_count > 0 then
			ranged_weakspot_damage_vs_staggered_ = stat_buffs.ranged_weakspot_damage_vs_staggered_ or ranged_weakspot_damage_vs_staggered_
		end

		local melee_weakspot_damage_vs_staggered_ = 1

		if is_melee and stagger_count > 0 then
			melee_weakspot_damage_vs_staggered_ = stat_buffs.melee_weakspot_damage_vs_staggered_ or melee_weakspot_damage_vs_staggered_
		end

		weakspot_damage_stat_buff = weakspot_damage_stat_buff + weakspot_damage - 1 + ranged_weakspot_damage - 1 + melee_weakspot_damage - 1 + ranged_weakspot_damage_vs_staggered_ - 1 + melee_weakspot_damage_vs_staggered_ - 1
	end

	local critical_damage_stat_buff = 1

	if is_critical_strike then
		local critical_damage = stat_buffs.critical_strike_damage or 1
		local ranged_critical_damage = is_ranged and stat_buffs.ranged_critical_strike_damage or 1
		local melee_critical_damage = is_melee and stat_buffs.melee_critical_strike_damage or 1
		critical_damage_stat_buff = critical_damage + ranged_critical_damage + melee_critical_damage - 2
	end

	local finesse_modifier_bonus = stat_buffs.finesse_modifier_bonus
	local finesse_buff_damage_multiplier = weakspot_damage_stat_buff + critical_damage_stat_buff + finesse_modifier_bonus - 2
	finesse_damage = finesse_damage * finesse_buff_damage_multiplier

	return finesse_damage
end

function _hit_zone_damage_multiplier(breed_or_nil, hit_zone_name, attack_type, ignore_hitzone_multiplier)
	if ignore_hitzone_multiplier or not breed_or_nil then
		return 1
	end

	local hitzone_damage_multiplier = breed_or_nil.hitzone_damage_multiplier

	if not hitzone_damage_multiplier then
		return 1
	end

	local default_hitzone_damage_multiplier = breed_or_nil.hitzone_damage_multiplier.default
	local attack_type_damage_multipliers = hitzone_damage_multiplier[attack_type] or default_hitzone_damage_multiplier

	if not attack_type_damage_multipliers then
		return 1
	end

	local hit_zone_damage_multiplier = attack_type_damage_multipliers[hit_zone_name] or default_hitzone_damage_multiplier and default_hitzone_damage_multiplier[hit_zone_name]

	if not hit_zone_damage_multiplier then
		return 1
	end

	return hit_zone_damage_multiplier
end

function _backstab_damage(damage, attack_type, stat_buffs, is_backstab)
	local backstab_damage_buff = 0

	if is_backstab and attack_type == attack_types.melee then
		local backstab_melee_stat_buff = stat_buffs.backstab_melee_damage or 1
		backstab_damage_buff = backstab_damage_buff + backstab_melee_stat_buff - 1
	end

	if is_backstab and attack_type == attack_types.ranged then
		local backstab_ranged_stat_buff = stat_buffs.backstab_ranged_damage or 1
		backstab_damage_buff = backstab_damage_buff + backstab_ranged_stat_buff - 1
	end

	local backstab_damage = damage * backstab_damage_buff

	return backstab_damage
end

return DamageCalculation