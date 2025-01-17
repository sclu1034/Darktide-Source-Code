local BaseWeaponTraitBuffTemplates = require("scripts/settings/buff/weapon_traits_buff_templates/base_weapon_trait_buff_templates")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local CheckProcFunctions = require("scripts/settings/buff/validation_functions/check_proc_functions")
local ConditionalFunctions = require("scripts/settings/buff/validation_functions/conditional_functions")
local FixedFrame = require("scripts/utilities/fixed_frame")
local stat_buffs = BuffSettings.stat_buffs
local proc_events = BuffSettings.proc_events
local keywords = BuffSettings.keywords
local templates = {
	weapon_trait_bespoke_shotgun_p1_increase_power_on_close_kill_parent = table.clone(BaseWeaponTraitBuffTemplates.increase_power_on_close_kill_parent),
	weapon_trait_bespoke_shotgun_p1_increase_power_on_close_kill_child = table.clone(BaseWeaponTraitBuffTemplates.increase_power_on_close_kill_child)
}
templates.weapon_trait_bespoke_shotgun_p1_increase_power_on_close_kill_parent.child_buff_template = "weapon_trait_bespoke_shotgun_p1_increase_power_on_close_kill_child"
templates.weapon_trait_bespoke_shotgun_p1_increase_close_damage_on_close_kill_parent = table.clone(BaseWeaponTraitBuffTemplates.increase_close_damage_on_close_kill_parent)
templates.weapon_trait_bespoke_shotgun_p1_increase_close_damage_on_close_kill_child = table.clone(BaseWeaponTraitBuffTemplates.increase_close_damage_on_close_kill_child)
templates.weapon_trait_bespoke_shotgun_p1_increase_close_damage_on_close_kill_parent.child_buff_template = "weapon_trait_bespoke_shotgun_p1_increase_close_damage_on_close_kill_child"
templates.weapon_trait_bespoke_shotgun_p1_count_as_dodge_vs_ranged_on_close_kill = table.clone(BaseWeaponTraitBuffTemplates.count_as_dodge_vs_ranged_on_close_kill)
templates.weapon_trait_bespoke_shotgun_p1_suppression_on_close_kill = table.clone(BaseWeaponTraitBuffTemplates.suppression_on_close_kill)
templates.weapon_trait_bespoke_shotgun_p1_power_bonus_on_hitting_single_enemy_with_all = table.clone(BaseWeaponTraitBuffTemplates.power_bonus_on_hitting_single_enemy_with_all)
templates.weapon_trait_bespoke_shotgun_p1_bleed_on_crit = table.clone(BaseWeaponTraitBuffTemplates.bleed_on_crit_pellets)
templates.weapon_trait_bespoke_shotgun_p1_crit_chance_on_hitting_multiple_with_one_shot = {
	predicted = false,
	allow_proc_while_active = true,
	max_stacks = 1,
	class_name = "proc_buff",
	active_duration = 4,
	proc_events = {
		[proc_events.on_shoot] = 1
	},
	proc_stat_buffs = {
		[stat_buffs.critical_strike_chance] = 0.05
	},
	conditional_proc_func = ConditionalFunctions.is_item_slot_wielded,
	check_proc_func = CheckProcFunctions.on_shoot_hit_multiple
}
templates.weapon_trait_bespoke_shotgun_p1_crit_chance_on_hitting_multiple_with_one_shot_parent = {
	stacks_to_remove = 5,
	child_buff_template = "weapon_trait_bespoke_shotgun_p1_crit_chance_on_hitting_multiple_with_one_shot_child",
	predicted = false,
	stack_offset = -1,
	max_stacks = 1,
	class_name = "weapon_trait_activated_parent_proc_buff",
	start_func = function (template_data)
		template_data.hit_units = {}
		template_data.num_hit_units = 0
	end,
	proc_events = {
		[proc_events.on_shoot] = 1
	},
	active_proc_func = {
		on_shoot = function (params)
			return true
		end
	},
	add_child_proc_events = {
		[proc_events.on_shoot] = function (params, template_data)
			if params.num_hit_units and params.num_hit_units > 1 then
				return params.num_hit_units
			else
				return 0
			end
		end
	},
	clear_child_stacks_proc_events = {
		[proc_events.on_action_start] = true
	},
	specific_check_proc_funcs = {
		[proc_events.on_action_start] = function (params, template_data, template_context)
			local kind = params.action_settings.kind

			return kind == "shoot_pellets"
		end
	},
	conditional_proc_func = ConditionalFunctions.is_item_slot_wielded
}
templates.weapon_trait_bespoke_shotgun_p1_crit_chance_on_hitting_multiple_with_one_shot_child = {
	hide_icon_in_hud = true,
	stack_offset = -1,
	max_stacks = 5,
	predicted = false,
	class_name = "buff",
	conditional_stat_buffs = {
		[stat_buffs.ranged_critical_strike_chance] = 0.1
	},
	conditional_stat_buffs_func = ConditionalFunctions.is_item_slot_wielded
}
templates.weapon_trait_bespoke_shotgun_p1_crit_chance_on_hitting_multiple_with_one_shot_parent.child_buff_template = "weapon_trait_bespoke_shotgun_p1_crit_chance_on_hitting_multiple_with_one_shot_child"
templates.weapon_trait_bespoke_shotgun_p1_stagger_count_bonus_damage = table.clone(BaseWeaponTraitBuffTemplates.stagger_count_bonus_damage)
templates.weapon_trait_bespoke_shotgun_p1_cleave_on_crit = {
	class_name = "buff",
	max_stacks = 1,
	predicted = false,
	hide_icon_in_hud = true,
	conditional_keywords = {
		keywords.critical_hit_infinite_cleave
	},
	conditional_keywords_func = ConditionalFunctions.is_item_slot_wielded
}

return templates
