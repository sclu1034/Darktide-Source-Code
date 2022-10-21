local BaseTemplateSettings = require("scripts/settings/equipment/weapon_templates/base_template_settings")
local DamageProfileTemplates = require("scripts/settings/damage/damage_profile_templates")
local HitScanTemplates = require("scripts/settings/projectile/hit_scan_templates")
local LineEffects = require("scripts/settings/effects/line_effects")
local PlayerCharacterConstants = require("scripts/settings/player_character/player_character_constants")
local ReloadTemplates = require("scripts/settings/equipment/reload_templates/reload_templates")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local WeaponTraitsRangedCommon = require("scripts/settings/equipment/weapon_traits/weapon_traits_ranged_common")
local WeaponTraitsRangedAimed = require("scripts/settings/equipment/weapon_traits/weapon_traits_ranged_aimed")
local SmartTargetingTemplates = require("scripts/settings/equipment/smart_targeting_templates")
local WeaponTweakTemplateSettings = require("scripts/settings/equipment/weapon_templates/weapon_tweak_template_settings")
local WeaponTraitTemplates = require("scripts/settings/equipment/weapon_templates/weapon_trait_templates/weapon_trait_templates")
local damage_types = DamageSettings.damage_types
local wield_inputs = PlayerCharacterConstants.wield_inputs
local template_types = WeaponTweakTemplateSettings.template_types
local damage_trait_templates = WeaponTraitTemplates[template_types.damage]
local recoil_trait_templates = WeaponTraitTemplates[template_types.recoil]
local dodge_trait_templates = WeaponTraitTemplates[template_types.dodge]
local sprint_trait_templates = WeaponTraitTemplates[template_types.sprint]
local movement_curve_modifier_trait_templates = WeaponTraitTemplates[template_types.movement_curve_modifier]
local spread_trait_templates = WeaponTraitTemplates[template_types.spread]
local ammo_trait_templates = WeaponTraitTemplates[template_types.ammo]
local sway_trait_templates = WeaponTraitTemplates[template_types.sway]
local weapon_template = {
	action_inputs = {
		shoot_pressed = {
			buffer_time = 0.1,
			max_queue = 2,
			input_sequence = {
				{
					value = true,
					input = "action_one_pressed"
				}
			}
		},
		zoom_shoot = {
			buffer_time = 0.1,
			max_queue = 2,
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
			buffer_time = 0,
			input_sequence = {
				{
					value = false,
					input = "action_two_hold",
					time_window = math.huge
				}
			}
		},
		reload = {
			buffer_time = 0,
			clear_input_queue = true,
			input_sequence = {
				{
					value = true,
					input = "weapon_reload"
				}
			}
		},
		wield = {
			buffer_time = 0,
			clear_input_queue = true,
			input_sequence = {
				{
					inputs = wield_inputs
				}
			}
		},
		special_action_quick_throw = {
			buffer_time = 0.2,
			input_sequence = {
				{
					value = true,
					input = "weapon_extra_pressed"
				}
			}
		}
	}
}

table.add_missing(weapon_template.action_inputs, BaseTemplateSettings.action_inputs)

weapon_template.action_input_hierarchy = {
	wield = "stay",
	special_action_quick_throw = "stay",
	reload = "stay",
	shoot_pressed = "stay",
	zoom = {
		special_action_quick_throw = "stay",
		wield = "base",
		zoom_shoot = "stay",
		zoom_release = "previous",
		grenade_ability = "base",
		reload = "base",
		combat_ability = "base"
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
			zoom = {
				action_name = "action_zoom",
				chain_time = 0.1
			},
			shoot_pressed = {
				action_name = "action_shoot_hip",
				chain_time = 0.2
			}
		}
	},
	action_shoot_hip = {
		sprint_requires_press_to_interrupt = true,
		recoil_template = "default_laspistol_assault",
		start_input = "shoot_pressed",
		kind = "shoot_hit_scan",
		sprint_ready_up_time = 0.2,
		spread_template = "default_laspistol_assault",
		abort_sprint = true,
		weapon_handling_template = "immediate_single_shot",
		allowed_during_sprint = true,
		ammunition_usage = 1,
		total_time = 0.5,
		action_movement_curve = {
			{
				modifier = 1.2,
				t = 0.1
			},
			{
				modifier = 1.35,
				t = 0.15
			},
			{
				modifier = 1.15,
				t = 0.175
			},
			{
				modifier = 1.05,
				t = 0.3
			},
			{
				modifier = 1,
				t = 0.5
			},
			start_modifier = 0.75
		},
		fx = {
			crit_shoot_sfx_alias = "critical_shot_extra",
			shoot_tail_sfx_alias = "ranged_shot_tail",
			muzzle_flash_effect = "content/fx/particles/weapons/rifles/lasgun/lasgun_muzzle",
			shoot_sfx_alias = "ranged_single_shot",
			spread_rotated_muzzle_flash = true,
			out_of_ammo_sfx_alias = "ranged_out_of_ammo",
			no_ammo_shoot_sfx_alias = "ranged_no_ammo",
			line_effect = LineEffects.lasbeam
		},
		fire_configuration = {
			anim_event = "attack_shoot",
			same_side_suppression_enabled = false,
			hit_scan_template = HitScanTemplates.default_laspistol_beam,
			damage_type = damage_types.laser
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
			shoot_pressed = {
				action_name = "action_shoot_hip",
				chain_time = 0.175
			},
			zoom = {
				action_name = "action_zoom",
				chain_time = 0.1
			},
			special_action_quick_throw = {
				action_name = "action_quick_throw_grenade",
				chain_time = 0.2
			}
		}
	},
	action_shoot_zoomed = {
		start_input = "zoom_shoot",
		kind = "shoot_hit_scan",
		sprint_ready_up_time = 0,
		weapon_handling_template = "immediate_single_shot",
		ammunition_usage = 1,
		crosshair_type = "ironsight",
		allowed_during_sprint = true,
		total_time = 0.3,
		action_movement_curve = {
			{
				modifier = 0.6,
				t = 0.05
			},
			{
				modifier = 0.65,
				t = 0.15
			},
			{
				modifier = 0.725,
				t = 0.175
			},
			{
				modifier = 0.85,
				t = 0.3
			},
			start_modifier = 0.5
		},
		fx = {
			crit_shoot_sfx_alias = "critical_shot_extra",
			shoot_tail_sfx_alias = "ranged_shot_tail",
			muzzle_flash_effect = "content/fx/particles/weapons/rifles/lasgun/lasgun_muzzle",
			shoot_sfx_alias = "ranged_single_shot",
			spread_rotated_muzzle_flash = true,
			no_ammo_shoot_sfx_alias = "ranged_no_ammo",
			line_effect = LineEffects.lasbeam
		},
		fire_configuration = {
			anim_event = "attack_shoot",
			same_side_suppression_enabled = false,
			hit_scan_template = HitScanTemplates.default_laspistol_beam,
			damage_type = damage_types.laser
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
			zoom_shoot = {
				action_name = "action_shoot_zoomed",
				chain_time = 0.175
			},
			zoom_release = {
				action_name = "action_unzoom",
				chain_time = 0.175
			},
			special_action_quick_throw = {
				action_name = "action_quick_throw_grenade",
				chain_time = 0.2
			}
		}
	},
	action_zoom = {
		crosshair_type = "none",
		start_input = "zoom",
		kind = "aim",
		total_time = 0.3,
		smart_targeting_template = SmartTargetingTemplates.alternate_fire_killshot,
		action_movement_curve = {
			{
				modifier = 0.75,
				t = 0.05
			},
			{
				modifier = 0.75,
				t = 0.15
			},
			{
				modifier = 0.725,
				t = 0.175
			},
			{
				modifier = 0.85,
				t = 0.3
			},
			{
				modifier = 0.8,
				t = 1
			},
			start_modifier = 0.5
		},
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield"
			},
			reload = {
				action_name = "action_reload"
			},
			zoom_shoot = {
				action_name = "action_shoot_zoomed",
				chain_time = 0.2
			}
		}
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
			reload = {
				action_name = "action_reload"
			},
			wield = {
				action_name = "action_unwield"
			},
			zoom = {
				action_name = "action_zoom"
			},
			special_action_quick_throw = {
				action_name = "action_quick_throw_grenade"
			}
		}
	},
	action_reload = {
		kind = "reload_state",
		stop_alternate_fire = true,
		start_input = "reload",
		sprint_requires_press_to_interrupt = true,
		abort_sprint = true,
		crosshair_type = "none",
		allowed_during_sprint = true,
		total_time = 3,
		action_movement_curve = {
			{
				modifier = 0.875,
				t = 0.05
			},
			{
				modifier = 0.95,
				t = 0.075
			},
			{
				modifier = 0.99,
				t = 0.25
			},
			{
				modifier = 1,
				t = 0.3
			},
			{
				modifier = 1.05,
				t = 0.8
			},
			{
				modifier = 1.05,
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
			shoot_pressed = {
				action_name = "action_shoot_hip",
				chain_time = 2
			},
			zoom = {
				action_name = "action_zoom",
				chain_time = 2
			},
			special_action_quick_throw = {
				action_name = "action_quick_throw_grenade",
				chain_time = 2
			}
		}
	},
	action_quick_throw_grenade = {
		use_ability_charge = true,
		kind = "throw_grenade",
		start_input = "special_action_quick_throw",
		spawn_node = "fx_spawn_lefthand",
		weapon_handling_template = "time_scale_1_5",
		throw_type = "quick_throw",
		ability_keyword = "grenade",
		crosshair_type = "none",
		spawn_at_time = 0.4,
		allowed_during_sprint = true,
		ability_type = "grenade_ability",
		priority = 1,
		recoil_template = "default_shotgun_killshot",
		uninterruptible = true,
		anim_event = "weapon_special",
		total_time = 0.7,
		fire_configuration = {
			skip_aiming = true
		},
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield",
				chain_time = 0.6
			},
			reload = {
				action_name = "action_reload",
				chain_time = 0.6
			},
			special_action_quick_throw = {
				action_name = "action_quick_throw_grenade",
				chain_time = 0.65
			},
			shoot_pressed = {
				action_name = "action_shoot_hip",
				chain_time = 0.5
			},
			zoom_shoot = {
				action_name = "action_shoot_zoomed",
				chain_time = 0.5
			},
			zoom_release = {
				action_name = "action_unzoom",
				chain_time = 0.7
			},
			zoom = {
				action_name = "action_zoom",
				chain_time = 0.65
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return false
		end
	},
	action_psyker_push = {
		push_radius = 10,
		start_input = "special_action_quick_throw",
		block_duration = 0.5,
		kind = "push",
		priority = 0,
		ability_keyword = "psyker",
		crosshair_type = "dot",
		ability_type = "grenade_ability",
		activation_cooldown = 2.3,
		charge_template = "handgun_push_charge",
		activate_special = true,
		damage_time = 0.4,
		uninterruptible = true,
		anim_event = "weapon_special_psyker",
		power_level = 500,
		total_time = 1,
		action_movement_curve = {
			{
				modifier = 1.2,
				t = 0.1
			},
			{
				modifier = 0.8,
				t = 0.25
			},
			{
				modifier = 0.5,
				t = 0.4
			},
			{
				modifier = 1,
				t = 1
			},
			start_modifier = 1.4
		},
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield"
			},
			reload = {
				action_name = "action_reload"
			},
			special_action_quick_throw = {
				action_name = "action_quick_throw_grenade",
				chain_time = 0.8
			},
			shoot_pressed = {
				action_name = "action_shoot_hip",
				chain_time = 0.5
			},
			zoom_shoot = {
				action_name = "action_shoot_zoomed",
				chain_time = 0.5
			},
			zoom_release = {
				action_name = "action_unzoom",
				chain_time = 0.9
			},
			zoom = {
				action_name = "action_zoom",
				chain_time = 0.5
			}
		},
		inner_push_rad = math.pi * 0.04,
		outer_push_rad = math.pi * 0.1,
		inner_damage_profile = DamageProfileTemplates.push_psyker,
		inner_damage_type = damage_types.physical,
		outer_damage_profile = DamageProfileTemplates.push_psyker_outer,
		outer_damage_type = damage_types.physical,
		fx = {
			vfx_effect = "content/fx/particles/weapons/swords/forcesword/psyker_push",
			fx_source = "head",
			fx_position_offset = Vector3Box(0, 2, 0)
		}
	},
	action_inspect = {
		skip_3p_anims = false,
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
weapon_template.base_stats = {
	laspistol_dps_stat = {
		display_name = "loc_trait_display_stubrevolver_dps_stat",
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
	laspistol_mobility_stat = {
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
	},
	laspistol_stability_stat = {
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
	laspistol_power_stat = {
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
	laspistol_ammo_stat = {
		display_name = "loc_stats_display_ammo_stat",
		is_stat_trait = true,
		ammo = {
			base = {
				ammo_trait_templates.default_ammo_stat
			}
		}
	}
}

table.add_missing(weapon_template.actions, BaseTemplateSettings.actions)

weapon_template.anim_state_machine_3p = "content/characters/player/human/third_person/animations/lasgun_pistol"
weapon_template.anim_state_machine_1p = "content/characters/player/human/first_person/animations/lasgun_pistol"
weapon_template.can_use_while_vaulting = true
weapon_template.reload_template = ReloadTemplates.laspistol
weapon_template.spread_template = "default_laspistol_assault"
weapon_template.recoil_template = "default_laspistol_assault"
weapon_template.ammo_template = "laspistol_p1_m1"
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
weapon_template.fx_sources = {
	_muzzle = "fx_muzzle_01"
}
weapon_template.crosshair_type = "assault"
weapon_template.hit_marker_type = "center"
weapon_template.alternate_fire_settings = {
	recoil_template = "default_laspistol_killshot",
	sway_template = "default_laspistol_killshot",
	stop_anim_event = "to_unaim_ironsight",
	crosshair_type = "none",
	start_anim_event = "to_ironsight",
	spread_template = "default_laspistol_killshot",
	camera = {
		custom_vertical_fov = 82,
		vertical_fov = 55,
		near_range = 0.025
	},
	action_movement_curve = {
		{
			modifier = 0.6,
			t = 0.05
		},
		{
			modifier = 0.75,
			t = 0.15
		},
		{
			modifier = 0.725,
			t = 0.175
		},
		{
			modifier = 0.85,
			t = 0.3
		},
		{
			modifier = 0.7,
			t = 1
		},
		start_modifier = 0.8
	}
}
weapon_template.keywords = {
	"ranged",
	"laspistol",
	"p1"
}
weapon_template.smart_targeting_template = SmartTargetingTemplates.killshot
weapon_template.dodge_template = "assault"
weapon_template.sprint_template = "assault"
weapon_template.stamina_template = "default"
weapon_template.toughness_template = "assault"
weapon_template.can_use_while_vaulting = true
weapon_template.movement_curve_modifier_template = "default"
weapon_template.footstep_intervals = {
	crouch_walking = 0.61,
	walking = 0.4,
	sprinting = 0.37
}
weapon_template.traits = {}
local ranged_common_traits = table.keys(WeaponTraitsRangedCommon)

table.append(weapon_template.traits, ranged_common_traits)

local ranged_aimed_traits = table.keys(WeaponTraitsRangedAimed)

table.append(weapon_template.traits, ranged_aimed_traits)

return weapon_template