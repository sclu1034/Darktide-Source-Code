local ToughnessSettings = require("scripts/settings/toughness/toughness_settings")
local ToughnessDepleted = require("scripts/utilities/toughness/toughness_depleted")
local weapon_toughness_templates = {}
local replenish_types = ToughnessSettings.replenish_types
weapon_toughness_templates.default = {
	regeneration_delay_modifier = {
		lerp_perfect = 0,
		lerp_basic = 1
	},
	regeneration_speed_modifier = {
		still = {
			lerp_perfect = 2,
			lerp_basic = 1
		},
		moving = {
			lerp_perfect = 2,
			lerp_basic = 1
		}
	},
	recovery_percentage_modifiers = {
		[replenish_types.melee_kill] = 1,
		[replenish_types.weakspot_proc_buff] = 0.15,
		[replenish_types.ogryn_braced_regen] = 0.02
	}
}
weapon_toughness_templates.auspex = {
	melee_damage_modifier = 0.25,
	toughness_damage_modifier = 0.5,
	optional_on_depleted_function_name_override = "block",
	regeneration_delay_modifier = {
		lerp_perfect = 0,
		lerp_basic = 1
	},
	regeneration_speed_modifier = {
		still = {
			lerp_perfect = 2,
			lerp_basic = 1
		},
		moving = {
			lerp_perfect = 2,
			lerp_basic = 1
		}
	},
	recovery_percentage_modifiers = {
		[replenish_types.melee_kill] = 1,
		[replenish_types.weakspot_proc_buff] = 0.15,
		[replenish_types.ogryn_braced_regen] = 0.02
	}
}
weapon_toughness_templates.luggable = {
	melee_damage_modifier = 0.25,
	toughness_damage_modifier = 1,
	optional_on_depleted_function_name_override = "block",
	regeneration_delay_modifier = {
		lerp_perfect = 100,
		lerp_basic = 100
	},
	regeneration_speed_modifier = {
		still = {
			lerp_perfect = 0.01,
			lerp_basic = 0.01
		},
		moving = {
			lerp_perfect = 0.01,
			lerp_basic = 0.01
		}
	},
	recovery_percentage_modifiers = {
		[replenish_types.melee_kill] = 1,
		[replenish_types.weakspot_proc_buff] = 0.15,
		[replenish_types.ogryn_braced_regen] = 0.02
	}
}
weapon_toughness_templates.assault = {
	regeneration_delay_modifier = 0.8,
	regeneration_speed_modifier = {
		still = 1,
		moving = 3
	},
	recovery_percentage_modifiers = {
		[replenish_types.melee_kill] = 1,
		[replenish_types.weakspot_proc_buff] = 0.15,
		[replenish_types.ogryn_braced_regen] = 0.02
	}
}
weapon_toughness_templates.killshot_zoomed = {
	optional_on_hit_function_name_override = "push_back",
	regeneration_delay_modifier = 1.5,
	optional_on_depleted_function_name_override = "spill_over",
	regeneration_speed_modifier = {
		still = 2,
		moving = 0.5
	},
	recovery_percentage_modifiers = {
		[replenish_types.melee_kill] = 1,
		[replenish_types.weakspot_proc_buff] = 0.15,
		[replenish_types.ogryn_braced_regen] = 0.02
	}
}

for name, settings in pairs(weapon_toughness_templates) do
	settings.name = name
end

return settings("WeaponToughnessTemplates", weapon_toughness_templates)