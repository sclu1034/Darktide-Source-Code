local AimAssistTemplates = require("scripts/settings/equipment/aim_assist_templates")
local BaseTemplateSettings = require("scripts/settings/equipment/weapon_templates/base_template_settings")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local HitScanTemplates = require("scripts/settings/projectile/hit_scan_templates")
local LineEffects = require("scripts/settings/effects/line_effects")
local PlayerCharacterConstants = require("scripts/settings/player_character/player_character_constants")
local ReloadTemplates = require("scripts/settings/equipment/reload_templates/reload_templates")
local SmartTargetingTemplates = require("scripts/settings/equipment/smart_targeting_templates")
local WeaponTraitsRangedCommon = require("scripts/settings/equipment/weapon_traits/weapon_traits_ranged_common")
local WeaponTraitsRangedHighFireRate = require("scripts/settings/equipment/weapon_traits/weapon_traits_ranged_high_fire_rate")
local WeaponTraitsRangedAimed = require("scripts/settings/equipment/weapon_traits/weapon_traits_ranged_aimed")
local WeaponTraitTemplates = require("scripts/settings/equipment/weapon_templates/weapon_trait_templates/weapon_trait_templates")
local WeaponTweakTemplateSettings = require("scripts/settings/equipment/weapon_templates/weapon_tweak_template_settings")
local damage_types = DamageSettings.damage_types
local buff_stat_buffs = BuffSettings.stat_buffs
local wield_inputs = PlayerCharacterConstants.wield_inputs
local template_types = WeaponTweakTemplateSettings.template_types
local damage_trait_templates = WeaponTraitTemplates[template_types.damage]
local dodge_trait_templates = WeaponTraitTemplates[template_types.dodge]
local recoil_trait_templates = WeaponTraitTemplates[template_types.recoil]
local spread_trait_templates = WeaponTraitTemplates[template_types.spread]
local sprint_trait_templates = WeaponTraitTemplates[template_types.sprint]
local ammo_trait_templates = WeaponTraitTemplates[template_types.ammo]
local sway_trait_templates = WeaponTraitTemplates[template_types.sway]
local movement_curve_modifier_trait_templates = WeaponTraitTemplates[template_types.movement_curve_modifier]
local weapon_template = {
	action_inputs = {
		shoot = {
			buffer_time = 0.25,
			input_sequence = {
				{
					value = true,
					input = "action_one_pressed"
				}
			}
		},
		shoot_release = {
			buffer_time = 0.31,
			input_sequence = {
				{
					value = false,
					input = "action_one_hold",
					time_window = math.huge
				}
			}
		},
		zoom_shoot = {
			buffer_time = 0.31,
			input_sequence = {
				{
					value = true,
					hold_input = "action_two_hold",
					input = "action_one_pressed"
				}
			}
		},
		zoom = {
			buffer_time = 0.4,
			input_sequence = {
				{
					value = true,
					input = "action_two_hold"
				}
			}
		},
		zoom_release = {
			buffer_time = 0.3,
			input_sequence = {
				{
					value = false,
					input = "action_two_hold",
					time_window = math.huge
				}
			}
		},
		reload = {
			buffer_time = 0.2,
			input_sequence = {
				{
					value = true,
					input = "weapon_reload"
				}
			}
		},
		wield = {
			buffer_time = 0.2,
			input_sequence = {
				{
					inputs = wield_inputs
				}
			}
		}
	}
}

table.add_missing(weapon_template.action_inputs, BaseTemplateSettings.action_inputs)

weapon_template.action_input_hierarchy = {
	wield = "stay",
	reload = "stay",
	shoot = {
		zoom = "base",
		wield = "base",
		grenade_ability = "base",
		reload = "base",
		combat_ability = "base",
		shoot_release = "base"
	},
	zoom = {
		zoom_release = "base",
		wield = "base",
		grenade_ability = "base",
		reload = "base",
		combat_ability = "base",
		zoom_shoot = {
			grenade_ability = "base",
			wield = "base",
			zoom_release = "base",
			reload = "base",
			combat_ability = "base",
			shoot_release = "previous"
		}
	}
}

table.add_missing(weapon_template.action_input_hierarchy, BaseTemplateSettings.action_input_hierarchy)

weapon_template.actions = {
	action_unwield = {
		continue_sprinting = true,
		allowed_during_sprint = true,
		start_input = "wield",
		uninterruptible = true,
		kind = "unwield",
		total_time = 0,
		allowed_chain_actions = {}
	},
	action_wield = {
		allowed_during_sprint = true,
		wield_anim_event = "equip",
		wield_reload_anim_event = "equip_reload",
		kind = "ranged_wield",
		continue_sprinting = true,
		uninterruptible = true,
		total_time = 1,
		conditional_state_to_action_input = {
			started_reload = {
				input_name = "reload"
			}
		},
		allowed_chain_actions = {
			combat_ability = {
				action_name = "combat_ability"
			},
			grenade_ability = {
				action_name = "grenade_ability"
			},
			wield = {
				action_name = "action_unwield"
			},
			reload = {
				action_name = "action_reload",
				chain_time = 0.275
			},
			zoom = {
				action_name = "action_zoom",
				chain_time = 0.5
			},
			shoot = {
				action_name = "action_shoot_hip",
				chain_time = 0.65
			}
		}
	},
	action_shoot_hip = {
		recoil_template = "default_autogun_killshot",
		sprint_requires_press_to_interrupt = true,
		start_input = "shoot",
		kind = "shoot_hit_scan",
		weapon_handling_template = "autogun_triple_burst_slow",
		sprint_ready_up_time = 0.2,
		ammunition_usage = 1,
		allowed_during_sprint = true,
		minimum_hold_time = 0.3,
		spread_template = "default_autogun_killshot",
		uninterruptible = true,
		stop_input = "shoot_release",
		total_time = math.huge,
		action_movement_curve = {
			{
				modifier = 1.1,
				t = 0.25
			},
			{
				modifier = 1,
				t = 0.4
			},
			{
				modifier = 0.75,
				t = 1
			},
			start_modifier = 1.25
		},
		fx = {
			no_ammo_shoot_sfx_alias = "ranged_no_ammo",
			crit_shoot_sfx_alias = "critical_shot_extra",
			muzzle_flash_effect = "content/fx/particles/weapons/rifles/autogun/autogun_muzzle",
			shoot_sfx_alias = "ranged_single_shot",
			spread_rotated_muzzle_flash = false,
			shell_casing_effect = "content/fx/particles/weapons/shells/shell_casing_autogun_01",
			shoot_tail_sfx_alias = "ranged_shot_tail",
			out_of_ammo_sfx_alias = "ranged_out_of_ammo",
			muzzle_flash_crit_effect = "content/fx/particles/weapons/rifles/autogun/autogun_muzzle_crit",
			line_effect = LineEffects.autogun_bullet
		},
		fire_configuration = {
			anim_event = "attack_shoot",
			same_side_suppression_enabled = false,
			hit_scan_template = HitScanTemplates.killshot_autogun_bullet,
			damage_type = damage_types.auto_bullet
		},
		allowed_chain_actions = {
			combat_ability = {
				action_name = "combat_ability"
			},
			grenade_ability = {
				action_name = "grenade_ability"
			},
			wield = {
				action_name = "action_unwield"
			},
			reload = {
				action_name = "action_reload"
			},
			zoom = {
				action_name = "action_zoom"
			},
			shoot = {
				action_name = "action_shoot_hip",
				chain_time = 0.25
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return false
		end,
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.ranged_attack_speed
		},
		aim_assist_ramp_template = AimAssistTemplates.killshot_fire
	},
	action_shoot_zoomed = {
		start_input = "zoom_shoot",
		minimum_hold_time = 0.3,
		kind = "shoot_hit_scan",
		sprint_ready_up_time = 0,
		weapon_handling_template = "autogun_triple_burst_slow",
		crosshair_type = "ironsight",
		ammunition_usage = 1,
		stop_input = "shoot_release",
		total_time = math.huge,
		action_movement_curve = {
			{
				modifier = 0.85,
				t = 0.25
			},
			{
				modifier = 0.7,
				t = 0.45
			},
			{
				modifier = 0.5,
				t = 2
			},
			start_modifier = 0.75
		},
		fx = {
			no_ammo_shoot_sfx_alias = "ranged_no_ammo",
			crit_shoot_sfx_alias = "critical_shot_extra",
			muzzle_flash_effect = "content/fx/particles/weapons/rifles/autogun/autogun_muzzle",
			shoot_sfx_alias = "ranged_single_shot",
			spread_rotated_muzzle_flash = false,
			shell_casing_effect = "content/fx/particles/weapons/shells/shell_casing_autogun_01",
			shoot_tail_sfx_alias = "ranged_shot_tail",
			out_of_ammo_sfx_alias = "ranged_out_of_ammo",
			muzzle_flash_crit_effect = "content/fx/particles/weapons/rifles/autogun/autogun_muzzle_crit",
			line_effect = LineEffects.autogun_bullet
		},
		fire_configuration = {
			anim_event = "attack_shoot",
			same_side_suppression_enabled = false,
			hit_scan_template = HitScanTemplates.killshot_autogun_bullet,
			damage_type = damage_types.auto_bullet
		},
		allowed_chain_actions = {
			combat_ability = {
				action_name = "combat_ability"
			},
			grenade_ability = {
				action_name = "grenade_ability"
			},
			zoom_shoot = {
				action_name = "action_shoot_zoomed",
				chain_time = 0.25
			},
			zoom_release = {
				action_name = "action_unzoom",
				chain_time = 0.2
			},
			wield = {
				action_name = "action_unwield"
			},
			reload = {
				action_name = "action_reload"
			}
		},
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.ranged_attack_speed
		},
		aim_assist_ramp_template = AimAssistTemplates.killshot_fire
	},
	action_zoom = {
		crosshair_type = "dot",
		start_input = "zoom",
		kind = "aim",
		total_time = 0.3,
		allowed_chain_actions = {
			combat_ability = {
				action_name = "combat_ability"
			},
			grenade_ability = {
				action_name = "grenade_ability"
			},
			wield = {
				action_name = "action_unwield"
			},
			reload = {
				action_name = "action_reload"
			},
			zoom_shoot = {
				action_name = "action_shoot_zoomed",
				chain_time = 0.25
			}
		},
		aim_assist_ramp_template = AimAssistTemplates.killshot_aim
	},
	action_unzoom = {
		crosshair_type = "none",
		start_input = "zoom_release",
		kind = "unaim",
		total_time = 0.2,
		allowed_chain_actions = {
			combat_ability = {
				action_name = "combat_ability"
			},
			grenade_ability = {
				action_name = "grenade_ability"
			},
			wield = {
				action_name = "action_unwield"
			},
			zoom = {
				action_name = "action_zoom"
			}
		},
		aim_assist_ramp_template = AimAssistTemplates.killshot_unaim
	},
	action_reload = {
		crosshair_type = "none",
		start_input = "reload",
		stop_alternate_fire = true,
		kind = "reload_state",
		total_time = 3.3,
		action_movement_curve = {
			{
				modifier = 0.775,
				t = 0.05
			},
			{
				modifier = 0.75,
				t = 0.075
			},
			{
				modifier = 0.59,
				t = 0.25
			},
			{
				modifier = 0.6,
				t = 0.3
			},
			{
				modifier = 0.85,
				t = 0.8
			},
			{
				modifier = 0.9,
				t = 0.9
			},
			{
				modifier = 1,
				t = 2
			},
			start_modifier = 1
		},
		allowed_chain_actions = {
			combat_ability = {
				action_name = "combat_ability"
			},
			grenade_ability = {
				action_name = "grenade_ability"
			},
			wield = {
				action_name = "action_unwield"
			},
			shoot = {
				action_name = "action_shoot_hip",
				chain_time = 3.1
			},
			zoom = {
				action_name = "action_zoom",
				chain_time = 3.1
			}
		},
		stat_buff_keywords = {
			buff_stat_buffs.reload_speed
		}
	},
	action_inspect = {
		skip_3p_anims = true,
		lock_view = true,
		start_input = "inspect_start",
		anim_end_event = "inspect_end",
		kind = "inspect",
		crosshair_type = "none",
		anim_event = "inspect_start",
		stop_input = "inspect_stop",
		total_time = math.huge
	}
}

table.add_missing(weapon_template.actions, BaseTemplateSettings.actions)

weapon_template.entry_actions = {
	primary_action = "action_shoot_hip",
	secondary_action = "action_zoom"
}
weapon_template.anim_state_machine_3p = "content/characters/player/human/third_person/animations/autogun_rifle"
weapon_template.anim_state_machine_1p = "content/characters/player/human/first_person/animations/autogun_rifle"
weapon_template.reload_template = ReloadTemplates.autogun
weapon_template.spread_template = "default_autogun_killshot"
weapon_template.recoil_template = "default_autogun_killshot"
weapon_template.suppression_template = "default_autogun_assault"
weapon_template.look_delta_template = "default"
weapon_template.conditional_state_to_action_input = {
	{
		conditional_state = "no_ammo_and_started_reload",
		input_name = "reload"
	},
	{
		conditional_state = "no_ammo",
		input_name = "reload"
	}
}
weapon_template.uses_ammunition = true
weapon_template.uses_overheat = false
weapon_template.sprint_ready_up_time = 0.1
weapon_template.max_first_person_anim_movement_speed = 5.8
weapon_template.ammo_template = "autogun_p3_m1"
weapon_template.fx_sources = {
	_eject = "fx_eject",
	_muzzle = "fx_muzzle_01",
	_mag_well = "fx_reload"
}
weapon_template.crosshair_type = "cross"
weapon_template.hit_marker_type = "center"
weapon_template.alternate_fire_settings = {
	stop_anim_event = "to_unaim_ironsight",
	sway_template = "fullauto_autogun_killshot",
	recoil_template = "default_autogun_killshot",
	start_anim_event_3p = "to_ironsight",
	spread_template = "default_autogun_alternate_fire_killshot",
	suppression_template = "fullauto_autogun_killshot",
	crosshair_type = "none",
	stop_anim_event_3p = "to_unaim_ironsight",
	start_anim_event = "to_ironsight",
	camera = {
		custom_vertical_fov = 30,
		vertical_fov = 35,
		near_range = 0.025
	},
	movement_speed_modifier = {
		{
			modifier = 0.775,
			t = 0.35
		},
		{
			modifier = 0.75,
			t = 0.375
		},
		{
			modifier = 0.59,
			t = 0.55
		},
		{
			modifier = 0.8,
			t = 2
		}
	}
}
weapon_template.keywords = {
	"ranged",
	"autogun",
	"p3"
}
weapon_template.can_use_while_vaulting = true
weapon_template.dodge_template = "killshot"
weapon_template.sprint_template = "killshot"
weapon_template.stamina_template = "default"
weapon_template.toughness_template = "default"
weapon_template.movement_curve_modifier_template = "default"
weapon_template.footstep_intervals = {
	crouch_walking = 0.61,
	walking = 0.4,
	sprinting = 0.37
}
weapon_template.smart_targeting_template = SmartTargetingTemplates.killshot
weapon_template.base_stats = {
	autogun_p1_m1_stability_stat = {
		description = "loc_trait_description_autogun_p1_m1_stability_stat",
		display_name = "loc_stats_display_stability_stat",
		is_stat_trait = true,
		recoil = {
			base = {
				recoil_trait_templates.default_recoil_stat
			},
			alternate_fire = {
				recoil_trait_templates.default_recoil_stat
			}
		},
		spread = {
			base = {
				spread_trait_templates.default_spread_stat
			}
		},
		sway = {
			alternate_fire = {
				sway_trait_templates.default_sway_stat
			}
		}
	},
	autogun_p1_m1_ammo_stat = {
		description = "loc_trait_description_autogun_p1_m1_ammo_stat",
		display_name = "loc_stats_display_ammo_stat",
		is_stat_trait = true,
		ammo = {
			base = {
				ammo_trait_templates.default_ammo_stat
			}
		}
	},
	autogun_p1_m1_dps_stat = {
		description = "loc_trait_description_autogun_p1_m1_dps_stat",
		display_name = "loc_stats_display_damage_stat",
		is_stat_trait = true,
		damage = {
			action_shoot_hip = {
				damage_trait_templates.default_dps_stat
			},
			action_shoot_zoomed = {
				damage_trait_templates.default_dps_stat
			}
		}
	},
	autogun_p1_m1_power_stat = {
		description = "loc_trait_description_autogun_p1_m1_power_stat",
		display_name = "loc_stats_display_power_stat",
		is_stat_trait = true,
		damage = {
			action_shoot_hip = {
				damage_trait_templates.default_power_stat
			},
			action_shoot_zoomed = {
				damage_trait_templates.default_power_stat
			}
		}
	},
	autogun_p1_m1_mobility_stat = {
		description = "loc_trait_description_autogun_p1_m1_mobility_stat",
		display_name = "loc_stats_display_mobility_stat",
		is_stat_trait = true,
		dodge = {
			base = {
				dodge_trait_templates.default_dodge_stat
			}
		},
		sprint = {
			base = {
				sprint_trait_templates.default_sprint_stat
			}
		},
		movement_curve_modifier = {
			base = {
				movement_curve_modifier_trait_templates.default_movement_curve_modifier_stat
			}
		},
		recoil = {
			base = {
				recoil_trait_templates.default_mobility_recoil_stat
			},
			alternate_fire = {
				recoil_trait_templates.default_mobility_recoil_stat
			}
		},
		spread = {
			base = {
				spread_trait_templates.default_mobility_spread_stat
			}
		}
	}
}
weapon_template.traits = {}
local ranged_common_traits = table.keys(WeaponTraitsRangedCommon)

table.append(weapon_template.traits, ranged_common_traits)

local ranged_high_fire_rate_traits = table.keys(WeaponTraitsRangedHighFireRate)

table.append(weapon_template.traits, ranged_high_fire_rate_traits)

local ranged_aimed_traits = table.keys(WeaponTraitsRangedAimed)

table.append(weapon_template.traits, ranged_aimed_traits)

weapon_template.perks = {
	autogun_p1_m1_stability_perk = {
		description = "loc_trait_description_autogun_p1_m1_stability_perk",
		display_name = "loc_trait_display_autogun_p1_m1_stability_perk",
		recoil = {
			base = {
				recoil_trait_templates.default_recoil_perk
			},
			alternate_fire = {
				recoil_trait_templates.default_recoil_perk
			}
		},
		spread = {
			base = {
				spread_trait_templates.default_spread_perk
			}
		},
		sway = {
			alternate_fire = {
				sway_trait_templates.default_sway_perk
			}
		}
	},
	autogun_p1_m1_ammo_perk = {
		description = "loc_trait_description_autogun_p1_m1_ammo_perk",
		display_name = "loc_trait_display_autogun_p1_m1_ammo_perk",
		ammo = {
			base = {
				ammo_trait_templates.default_ammo_perk
			}
		}
	},
	autogun_p1_m1_dps_perk = {
		description = "loc_trait_description_autogun_p1_m1_dps_perk",
		display_name = "loc_trait_display_autogun_p1_m1_dps_perk",
		damage = {
			action_shoot_hip = {
				damage_trait_templates.default_dps_perk
			},
			action_shoot_zoomed = {
				damage_trait_templates.default_dps_perk
			}
		}
	},
	autogun_p1_m1_power_perk = {
		description = "loc_trait_description_autogun_p1_m1_power_perk",
		display_name = "loc_trait_display_autogun_p1_m1_power_perk",
		damage = {
			action_shoot_hip = {
				damage_trait_templates.default_power_perk
			},
			action_shoot_zoomed = {
				damage_trait_templates.default_power_perk
			}
		}
	},
	autogun_p1_m1_mobility_perk = {
		description = "loc_trait_description_autogun_p1_m1_mobility_perk",
		display_name = "loc_trait_display_autogun_p1_m1_mobility_perk",
		dodge = {
			base = {
				dodge_trait_templates.default_dodge_perk
			}
		},
		sprint = {
			base = {
				sprint_trait_templates.default_sprint_perk
			}
		},
		movement_curve_modifier = {
			base = {
				movement_curve_modifier_trait_templates.default_movement_curve_modifier_perk
			}
		},
		recoil = {
			base = {
				recoil_trait_templates.default_recoil_perk
			},
			alternate_fire = {
				recoil_trait_templates.default_recoil_perk
			}
		},
		spread = {
			base = {
				spread_trait_templates.default_mobility_spread_perk
			}
		}
	}
}
weapon_template.displayed_keywords = {
	{
		display_name = "loc_weapon_keyword_autogun_p1_m1_description_1",
		icon_type = "crosshair"
	},
	{
		display_name = "loc_weapon_keyword_autogun_p1_m1_description_2",
		icon_type = "shield"
	},
	{
		display_name = "loc_weapon_keyword_autogun_p1_m1_description_3",
		icon_type = "shield"
	}
}
weapon_template.displayed_attacks = {
	primary = {
		display_name = "loc_autogun_p1_m1_attack_primary",
		type = "ninja_fencer"
	},
	secondary = {
		display_name = "loc_autogun_p1_m1_attack_secondary",
		type = "ninja_fencer"
	},
	special = {
		display_name = "loc_autogun_p1_m1_attack_special",
		type = "ninja_fencer"
	}
}

return weapon_template