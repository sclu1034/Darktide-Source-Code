local BaseWeaponTraitBuffTemplates = require("scripts/settings/buff/weapon_traits_buff_templates/base_weapon_trait_buff_templates")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local CheckProcFunctions = require("scripts/settings/buff/validation_functions/check_proc_functions")
local ConditionalFunctions = require("scripts/settings/buff/validation_functions/conditional_functions")
local keywords = BuffSettings.keywords
local stat_buffs = BuffSettings.stat_buffs
local proc_events = BuffSettings.proc_events
local templates = {}
local bolter_continuous_fire_step = 5
templates.weapon_trait_bespoke_bolter_p1_targets_receive_rending_debuff = table.clone(BaseWeaponTraitBuffTemplates.targets_receive_rending_debuff)
templates.weapon_trait_bespoke_bolter_p1_targets_receive_rending_debuff.check_proc_func = CheckProcFunctions.on_ranged_hit
templates.weapon_trait_bespoke_bolter_p1_stacking_power_bonus_on_staggering_enemies_parent = table.clone(BaseWeaponTraitBuffTemplates.stacking_power_bonus_on_staggering_enemies_parent)
templates.weapon_trait_bespoke_bolter_p1_stacking_power_bonus_on_staggering_enemies_parent.child_buff_template = "weapon_trait_bespoke_bolter_p1_stacking_power_bonus_on_staggering_enemies_child"
templates.weapon_trait_bespoke_bolter_p1_stacking_power_bonus_on_staggering_enemies_child = table.clone(BaseWeaponTraitBuffTemplates.stacking_power_bonus_on_staggering_enemies_child)
templates.weapon_trait_bespoke_bolter_p1_crit_chance_based_on_aim_time = table.clone(BaseWeaponTraitBuffTemplates.chance_based_on_aim_time)
templates.weapon_trait_bespoke_bolter_p1_toughness_on_elite_kills = table.clone(BaseWeaponTraitBuffTemplates.toughness_on_elite_kills)
templates.weapon_trait_bespoke_bolter_p1_stacking_crit_bonus_on_continuous_fire = table.merge({
	conditional_stat_buffs = {
		[stat_buffs.critical_strike_chance] = 0.01
	},
	continuous_fire_step = bolter_continuous_fire_step
}, BaseWeaponTraitBuffTemplates.stacking_buff_on_continuous_fire)
templates.weapon_trait_bespoke_bolter_p1_toughness_on_continuous_fire = table.merge({
	conditional_stat_buffs = {
		[stat_buffs.toughness_extra_regen_rate] = 0.5
	},
	continuous_fire_step = bolter_continuous_fire_step
}, BaseWeaponTraitBuffTemplates.stacking_buff_on_continuous_fire)

return templates
