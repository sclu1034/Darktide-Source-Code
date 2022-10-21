local AilmentSettings = require("scripts/settings/ailments/ailment_settings")
local Attack = require("scripts/utilities/attack/attack")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local DamageProfileTemplates = require("scripts/settings/damage/damage_profile_templates")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local MinionState = require("scripts/utilities/minion_state")
local ailment_effects = AilmentSettings.effects
local buff_keywords = BuffSettings.keywords
local buff_stat_buffs = BuffSettings.stat_buffs
local damage_types = DamageSettings.damage_types
local templates = {
	flamer_assault = {
		interval = 0.75,
		max_stacks_cap = 31,
		predicted = false,
		refresh_duration_on_stack = true,
		max_stacks = 31,
		duration = 4,
		class_name = "interval_buff",
		keywords = {
			buff_keywords.burning
		},
		interval_func = function (template_data, template_context, template)
			local unit = template_context.unit

			if HEALTH_ALIVE[unit] then
				local damage_template = DamageProfileTemplates.burning
				local stack_multiplier = template_context.stack_count / template.max_stacks
				local power_level = stack_multiplier * stack_multiplier * 500
				local owner_unit = template_context.is_server and template_context.owner_unit or nil
				local source_item = template_context.is_server and template_context.source_item or nil

				Attack.execute(unit, damage_template, "power_level", power_level, "damage_type", damage_types.burning, "attacking_unit", owner_unit, "item", source_item)
			end
		end,
		minion_effects = {
			ailment_effect = ailment_effects.burning,
			node_effects = {
				{
					node_name = "j_spine",
					vfx = {
						material_emission = true,
						particle_effect = "content/fx/particles/enemies/buff_burning",
						orphaned_policy = "destroy",
						stop_type = "stop"
					},
					sfx = {
						looping_wwise_stop_event = "wwise/events/weapon/stop_enemy_on_fire",
						looping_wwise_start_event = "wwise/events/weapon/play_enemy_on_fire"
					}
				}
			}
		}
	},
	warp_fire_assault = {
		interval = 0.75,
		max_stacks_cap = 31,
		predicted = false,
		refresh_duration_on_stack = true,
		max_stacks = 31,
		duration = 4,
		class_name = "interval_buff",
		keywords = {
			buff_keywords.burning
		},
		interval_func = function (template_data, template_context, template)
			local unit = template_context.unit

			if HEALTH_ALIVE[unit] then
				local damage_template = DamageProfileTemplates.burning
				local stack_multiplier = template_context.stack_count / template.max_stacks
				local power_level = stack_multiplier * stack_multiplier * 500
				local owner_unit = template_context.is_server and template_context.owner_unit or nil
				local source_item = template_context.is_server and template_context.source_item or nil

				Attack.execute(unit, damage_template, "power_level", power_level, "damage_type", damage_types.burning, "attacking_unit", owner_unit, "item", source_item)
			end
		end,
		minion_effects = {
			ailment_effect = ailment_effects.warpfire,
			node_effects = {
				{
					node_name = "j_spine",
					vfx = {
						material_emission = true,
						particle_effect = "content/fx/particles/enemies/buff_warpfire",
						orphaned_policy = "destroy",
						stop_type = "stop"
					},
					sfx = {
						looping_wwise_stop_event = "wwise/events/weapon/stop_enemy_on_fire",
						looping_wwise_start_event = "wwise/events/weapon/play_enemy_on_fire"
					}
				}
			}
		}
	},
	bleed = {
		interval = 0.75,
		predicted = false,
		refresh_duration_on_stack = true,
		max_stacks = 16,
		duration = 4,
		class_name = "interval_buff",
		keywords = {
			buff_keywords.bleeding
		},
		interval_func = function (template_data, template_context, template)
			local unit = template_context.unit

			if HEALTH_ALIVE[unit] then
				local damage_template = DamageProfileTemplates.bleeding
				local power_level = 15
				local source_item = template_context.is_server and template_context.source_item or nil
				local owner_unit = template_context.is_server and template_context.owner_unit or template_context.unit or nil

				Attack.execute(unit, damage_template, "power_level", power_level, "damage_type", damage_types.bleeding, "attacking_unit", owner_unit, "item", source_item)
			end
		end,
		minion_effects = {
			node_effects = {
				{
					node_name = "j_spine",
					vfx = {
						material_emission = true,
						particle_effect = "content/fx/particles/enemies/buff_bleeding",
						orphaned_policy = "destroy",
						stop_type = "stop"
					}
				}
			}
		}
	},
	increase_impact_received_while_staggered = {
		predicted = false,
		refresh_duration_on_stack = true,
		max_stacks = 8,
		duration = 5,
		class_name = "buff",
		conditional_stat_buffs = {
			[buff_stat_buffs.impact_modifier] = 0.05
		},
		conditional_stat_buffs_func = function (template_data, template_context)
			local unit = template_context.unit

			return MinionState.is_staggered(unit)
		end
	},
	increase_damage_received_while_staggered = {
		predicted = false,
		refresh_duration_on_stack = true,
		max_stacks = 8,
		duration = 5,
		class_name = "buff",
		conditional_stat_buffs = {
			[buff_stat_buffs.damage_vs_staggered] = 0.05
		},
		conditional_stat_buffs_func = function (template_data, template_context)
			local unit = template_context.unit

			return MinionState.is_staggered(unit)
		end
	},
	rending_debuff = {
		predicted = false,
		refresh_duration_on_stack = true,
		max_stacks = 8,
		duration = 5,
		class_name = "buff",
		stat_buffs = {
			[buff_stat_buffs.rending_multiplier] = 0.05
		}
	}
}

return templates
