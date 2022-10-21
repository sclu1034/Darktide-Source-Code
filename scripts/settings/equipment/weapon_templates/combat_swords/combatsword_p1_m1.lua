local ArmorSettings = require("scripts/settings/damage/armor_settings")
local BaseTemplateSettings = require("scripts/settings/equipment/weapon_templates/base_template_settings")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local DamageProfileTemplates = require("scripts/settings/damage/damage_profile_templates")
local DefaultMeleeActionInputSetup = require("scripts/settings/equipment/weapon_templates/default_melee_action_input_setup")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local HitZone = require("scripts/utilities/attack/hit_zone")
local WeaponTraitTemplates = require("scripts/settings/equipment/weapon_templates/weapon_trait_templates/weapon_trait_templates")
local WeaponTweakTemplateSettings = require("scripts/settings/equipment/weapon_templates/weapon_tweak_template_settings")
local PlayerCharacterConstants = require("scripts/settings/player_character/player_character_constants")
local WeaponTraitTemplates = require("scripts/settings/equipment/weapon_templates/weapon_trait_templates/weapon_trait_templates")
local WeaponTweakTemplateSettings = require("scripts/settings/equipment/weapon_templates/weapon_tweak_template_settings")
local PlayerCharacterConstants = require("scripts/settings/player_character/player_character_constants")
local SmartTargetingTemplates = require("scripts/settings/equipment/smart_targeting_templates")
local WoundsSettings = require("scripts/settings/wounds/wounds_settings")
local WeaponTraitsMeleeCommon = require("scripts/settings/equipment/weapon_traits/weapon_traits_melee_common")
local damage_types = DamageSettings.damage_types
local armor_types = ArmorSettings.types
local buff_stat_buffs = BuffSettings.stat_buffs
local hit_zone_names = HitZone.hit_zone_names
local buff_stat_buffs = BuffSettings.stat_buffs
local buff_targets = WeaponTweakTemplateSettings.buff_targets
local damage_types = DamageSettings.damage_types
local template_types = WeaponTweakTemplateSettings.template_types
local wield_inputs = PlayerCharacterConstants.wield_inputs
local weapon_template = {}
local wounds_shapes = WoundsSettings.shapes
local combat_sword_action_inputs = table.clone(DefaultMeleeActionInputSetup.action_inputs)
combat_sword_action_inputs.parry = {
	buffer_time = 0
}
local combat_sword_action_input_hierarchy = table.clone(DefaultMeleeActionInputSetup.action_input_hierarchy)
combat_sword_action_input_hierarchy.parry = "base"
weapon_template.action_inputs = combat_sword_action_inputs
weapon_template.action_input_hierarchy = combat_sword_action_input_hierarchy
local damage_trait_templates = WeaponTraitTemplates[template_types.damage]
local dodge_trait_templates = WeaponTraitTemplates[template_types.dodge]
local recoil_trait_templates = WeaponTraitTemplates[template_types.recoil]
local spread_trait_templates = WeaponTraitTemplates[template_types.spread]
local sprint_trait_templates = WeaponTraitTemplates[template_types.sprint]
local stamina_trait_templates = WeaponTraitTemplates[template_types.stamina]
local ammo_trait_templates = WeaponTraitTemplates[template_types.ammo]
local sway_trait_templates = WeaponTraitTemplates[template_types.sway]
local toughness_trait_templates = WeaponTraitTemplates[template_types.toughness]
local weapon_handling_trait_templates = WeaponTraitTemplates[template_types.weapon_handling]
local movement_curve_modifier_trait_templates = WeaponTraitTemplates[template_types.movement_curve_modifier]
local default_weapon_box = {
	0.2,
	0.1,
	1.1
}
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
		continue_sprinting = true,
		allowed_during_sprint = true,
		kind = "wield",
		uninterruptible = true,
		anim_event = "equip",
		sprint_ready_up_time = 0,
		total_time = 0.1,
		allowed_chain_actions = {}
	},
	action_melee_start_left = {
		anim_end_event = "attack_finished",
		start_input = "start_attack",
		kind = "windup",
		allowed_during_sprint = true,
		anim_event = "attack_swing_charge_left",
		stop_input = "attack_cancel",
		total_time = 3,
		action_movement_curve = {
			{
				modifier = 0.65,
				t = 0.05
			},
			{
				modifier = 0.7,
				t = 0.1
			},
			{
				modifier = 0.9,
				t = 0.25
			},
			{
				modifier = 0.85,
				t = 0.4
			},
			{
				modifier = 0.85,
				t = 0.5
			},
			{
				modifier = 0.835,
				t = 0.55
			},
			{
				modifier = 0.95,
				t = 3
			},
			start_modifier = 0.75
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
			light_attack = {
				action_name = "action_left_light",
				chain_time = 0
			},
			heavy_attack = {
				action_name = "action_left_heavy",
				chain_time = 0.75
			},
			block = {
				action_name = "action_block"
			},
			special_action = {
				action_name = "action_parry_special"
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end
	},
	action_left_light = {
		damage_window_start = 0.3,
		hit_armor_anim = "attack_hit_shield",
		anim_end_event = "attack_finished",
		kind = "sweep",
		weapon_handling_template = "time_scale_1",
		range_mod = 1.25,
		power_level = 500,
		allowed_during_sprint = true,
		damage_window_end = 0.4,
		anim_event = "attack_swing_left_diagonal",
		hit_stop_anim = "hit_stop",
		total_time = 2,
		action_movement_curve = {
			{
				modifier = 1.15,
				t = 0.2
			},
			{
				modifier = 1.05,
				t = 0.35
			},
			{
				modifier = 0.7,
				t = 0.5
			},
			{
				modifier = 0.65,
				t = 0.55
			},
			{
				modifier = 0.65,
				t = 0.6
			},
			{
				modifier = 1,
				t = 0.7
			},
			{
				modifier = 1.05,
				t = 0.75
			},
			{
				modifier = 1.04,
				t = 0.8
			},
			{
				modifier = 1,
				t = 1
			},
			start_modifier = 1.3
		},
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield"
			},
			start_attack = {
				action_name = "action_melee_start_right",
				chain_time = 0.4
			},
			block = {
				action_name = "action_block",
				chain_time = 0
			},
			special_action = {
				action_name = "action_parry_special",
				chain_time = 0.4
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		weapon_box = default_weapon_box,
		spline_settings = {
			matrices_data_location = "content/characters/player/human/first_person/animations/combat_sword/swing_left_diagonal",
			anchor_point_offset = {
				0,
				0,
				-0.3
			}
		},
		damage_profile = DamageProfileTemplates.light_combatsword_linesman,
		damage_type = damage_types.metal_slashing_light,
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.melee_attack_speed
		},
		wounds_shape = wounds_shapes.left_45_slash
	},
	action_left_heavy = {
		damage_window_start = 0.1,
		hit_armor_anim = "attack_hit_shield",
		anim_end_event = "attack_finished",
		weapon_handling_template = "time_scale_1",
		kind = "sweep",
		range_mod = 1.25,
		power_level = 500,
		allowed_during_sprint = true,
		damage_window_end = 0.3,
		anim_event = "attack_swing_heavy_left",
		hit_stop_anim = "hit_stop",
		total_time = 1,
		action_movement_curve = {
			{
				modifier = 1.3,
				t = 0.15
			},
			{
				modifier = 1.25,
				t = 0.4
			},
			{
				modifier = 0.5,
				t = 0.6
			},
			{
				modifier = 1,
				t = 1
			},
			start_modifier = 1.5
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
			start_attack = {
				action_name = "action_melee_start_right",
				chain_time = 0.24
			},
			block = {
				chain_time = 0.4,
				action_name = "action_block",
				chain_until = 0.1
			},
			special_action = {
				action_name = "action_parry_special",
				chain_time = 0.4
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		weapon_box = default_weapon_box,
		spline_settings = {
			matrices_data_location = "content/characters/player/human/first_person/animations/combat_sword/heavy_swing_left",
			anchor_point_offset = {
				0,
				0,
				-0.15
			}
		},
		damage_profile = DamageProfileTemplates.heavy_combatsword,
		damage_type = damage_types.metal_slashing_light,
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.melee_attack_speed
		},
		wounds_shape = wounds_shapes.horizontal_slash
	},
	action_melee_start_right = {
		anim_end_event = "attack_finished",
		kind = "windup",
		anim_event = "attack_swing_charge_right",
		hit_stop_anim = "attack_hit",
		stop_input = "attack_cancel",
		total_time = 3,
		action_movement_curve = {
			{
				modifier = 0.65,
				t = 0.05
			},
			{
				modifier = 0.7,
				t = 0.1
			},
			{
				modifier = 0.9,
				t = 0.25
			},
			{
				modifier = 0.85,
				t = 0.4
			},
			{
				modifier = 0.85,
				t = 0.5
			},
			{
				modifier = 0.835,
				t = 0.55
			},
			{
				modifier = 0.95,
				t = 3
			},
			start_modifier = 0.75
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
			light_attack = {
				action_name = "action_right_light",
				chain_time = 0
			},
			heavy_attack = {
				action_name = "action_right_heavy",
				chain_time = 0.54
			},
			block = {
				action_name = "action_block"
			},
			special_action = {
				action_name = "action_parry_special"
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end
	},
	action_right_light = {
		damage_window_start = 0.3,
		hit_armor_anim = "attack_hit_shield",
		anim_end_event = "attack_finished",
		range_mod = 1.25,
		kind = "sweep",
		weapon_handling_template = "time_scale_1",
		power_level = 500,
		damage_window_end = 0.5,
		anim_event = "attack_swing_right_diagonal",
		hit_stop_anim = "hit_stop",
		total_time = 2,
		action_movement_curve = {
			{
				modifier = 1.15,
				t = 0.2
			},
			{
				modifier = 1.05,
				t = 0.35
			},
			{
				modifier = 0.7,
				t = 0.5
			},
			{
				modifier = 0.65,
				t = 0.55
			},
			{
				modifier = 0.65,
				t = 0.6
			},
			{
				modifier = 0.9,
				t = 0.8
			},
			{
				modifier = 0.975,
				t = 0.85
			},
			{
				modifier = 1,
				t = 1
			},
			start_modifier = 1.3
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
			start_attack = {
				action_name = "action_melee_start_left_2",
				chain_time = 0.5
			},
			block = {
				action_name = "action_block",
				chain_time = 0
			},
			special_action = {
				action_name = "action_parry_special",
				chain_time = 0.45
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		weapon_box = default_weapon_box,
		spline_settings = {
			matrices_data_location = "content/characters/player/human/first_person/animations/combat_sword/swing_right_diagonal",
			anchor_point_offset = {
				0,
				0,
				-0.2
			}
		},
		damage_profile = DamageProfileTemplates.light_combatsword_linesman,
		damage_type = damage_types.metal_slashing_light,
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.melee_attack_speed
		},
		wounds_shape = wounds_shapes.right_45_slash
	},
	action_right_heavy = {
		damage_window_start = 0.1,
		hit_armor_anim = "attack_hit_shield",
		anim_end_event = "attack_finished",
		range_mod = 1.25,
		kind = "sweep",
		weapon_handling_template = "time_scale_1",
		power_level = 500,
		damage_window_end = 0.3,
		anim_event = "attack_swing_heavy_right",
		hit_stop_anim = "hit_stop",
		total_time = 1,
		action_movement_curve = {
			{
				modifier = 1.3,
				t = 0.15
			},
			{
				modifier = 1.25,
				t = 0.4
			},
			{
				modifier = 0.5,
				t = 0.6
			},
			{
				modifier = 1,
				t = 1
			},
			start_modifier = 1.5
		},
		allowed_chain_actions = {
			combat_ability = {
				action_name = "combat_ability"
			},
			grenade_ability = {
				action_name = "grenade_ability"
			},
			wield = {
				action_name = "action_unwield",
				chain_time = 0.3
			},
			start_attack = {
				action_name = "action_melee_start_left_2",
				chain_time = 0.3
			},
			block = {
				chain_time = 0.45,
				action_name = "action_block",
				chain_until = 0.05
			},
			special_action = {
				action_name = "action_parry_special",
				chain_time = 0.5
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		weapon_box = default_weapon_box,
		spline_settings = {
			matrices_data_location = "content/characters/player/human/first_person/animations/combat_sword/heavy_swing_right",
			anchor_point_offset = {
				0,
				0,
				-0.2
			}
		},
		damage_profile = DamageProfileTemplates.heavy_combatsword,
		damage_type = damage_types.metal_slashing_light,
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.melee_attack_speed
		},
		wounds_shape = wounds_shapes.horizontal_slash
	},
	action_melee_start_left_2 = {
		hit_armor_anim = "attack_hit_shield",
		anim_end_event = "attack_finished",
		kind = "windup",
		anim_event = "attack_swing_charge_left",
		hit_stop_anim = "hit_stop",
		stop_input = "attack_cancel",
		total_time = 3,
		action_movement_curve = {
			{
				modifier = 0.65,
				t = 0.05
			},
			{
				modifier = 0.7,
				t = 0.1
			},
			{
				modifier = 0.9,
				t = 0.25
			},
			{
				modifier = 0.85,
				t = 0.4
			},
			{
				modifier = 0.85,
				t = 0.5
			},
			{
				modifier = 0.835,
				t = 0.55
			},
			{
				modifier = 0.95,
				t = 3
			},
			start_modifier = 0.75
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
			light_attack = {
				action_name = "action_left_light_2",
				chain_time = 0
			},
			heavy_attack = {
				action_name = "action_left_heavy",
				chain_time = 0.56
			},
			block = {
				action_name = "action_block"
			},
			special_action = {
				action_name = "action_parry_special",
				chain_time = 0.5
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end
	},
	action_left_light_2 = {
		damage_window_start = 0.4,
		hit_armor_anim = "attack_hit_shield",
		anim_end_event = "attack_finished",
		range_mod = 1.25,
		kind = "sweep",
		attack_direction_override = "push",
		power_level = 500,
		weapon_handling_template = "time_scale_1",
		damage_window_end = 0.48,
		anim_event = "attack_swing_down_left",
		hit_stop_anim = "hit_stop",
		total_time = 2,
		action_movement_curve = {
			{
				modifier = 1.25,
				t = 0.2
			},
			{
				modifier = 1.05,
				t = 0.35
			},
			{
				modifier = 0.7,
				t = 0.5
			},
			{
				modifier = 0.65,
				t = 0.55
			},
			{
				modifier = 0.65,
				t = 0.6
			},
			{
				modifier = 0.9,
				t = 0.8
			},
			{
				modifier = 0.975,
				t = 0.85
			},
			{
				modifier = 1,
				t = 1
			},
			start_modifier = 1.3
		},
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield"
			},
			start_attack = {
				action_name = "action_melee_start_left",
				chain_time = 0.55
			},
			block = {
				action_name = "action_block",
				chain_time = 0
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		weapon_box = default_weapon_box,
		spline_settings = {
			matrices_data_location = "content/characters/player/human/first_person/animations/combat_sword/swing_down_left",
			anchor_point_offset = {
				0,
				0,
				-0.1
			}
		},
		damage_profile = DamageProfileTemplates.light_combatsword_smiter,
		damage_type = damage_types.metal_slashing_light,
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.melee_attack_speed
		},
		wounds_shape = wounds_shapes.vertical_slash
	},
	action_block = {
		anim_event = "parry_pose",
		start_input = "block",
		anim_end_event = "parry_finished",
		kind = "block",
		stop_input = "block_release",
		total_time = math.huge,
		action_movement_curve = {
			{
				modifier = 0.75,
				t = 0.2
			},
			{
				modifier = 0.82,
				t = 0.3
			},
			{
				modifier = 0.8,
				t = 0.325
			},
			{
				modifier = 0.81,
				t = 0.35
			},
			{
				modifier = 0.85,
				t = 0.5
			},
			{
				modifier = 0.85,
				t = 1
			},
			{
				modifier = 0.8,
				t = 2
			},
			start_modifier = 1
		},
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield"
			},
			push = {
				action_name = "action_push"
			},
			special_action = {
				action_name = "action_parry_special"
			}
		}
	},
	action_parry_special = {
		kind = "block",
		start_input = "special_action",
		anim_end_event = "parry_finished",
		weapon_handling_template = "time_scale_1",
		anim_event = "parry_special",
		free_block = true,
		total_time = 0.75,
		action_movement_curve = {
			{
				modifier = 0.5,
				t = 0.2
			},
			{
				modifier = 1,
				t = 0.5
			},
			start_modifier = 0.4
		},
		action_keywords = {
			"weapon_special"
		},
		running_action_state_to_action_input = {
			has_blocked = {
				input_name = "parry"
			}
		},
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield"
			},
			parry = {
				action_name = "action_attack_special",
				chain_time = 0.2
			},
			block = {
				action_name = "action_block",
				chain_time = 0.47
			}
		}
	},
	action_attack_special = {
		damage_window_start = 0.15333333333333335,
		anim_end_event = "attack_finished",
		range_mod = 1.25,
		kind = "sweep",
		weapon_handling_template = "time_scale_1",
		attack_direction_override = "push",
		damage_window_end = 0.19999999999999998,
		anim_event = "attack_special",
		power_level = 500,
		total_time = 1,
		action_movement_curve = {
			{
				modifier = 1,
				t = 0.15
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
				action_name = "action_unwield",
				chain_time = 0.3
			},
			start_attack = {
				action_name = "action_melee_start_left_2",
				chain_time = 0.4
			},
			block = {
				chain_time = 0.45,
				action_name = "action_block",
				chain_until = 0.05
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		weapon_box = {
			0.1,
			0.1,
			1.1
		},
		spline_settings = {
			matrices_data_location = "content/characters/player/human/first_person/animations/combat_sword/stab_special",
			anchor_point_offset = {
				-0.15,
				0,
				-0.1
			}
		},
		damage_profile = DamageProfileTemplates.light_combatsword_smiter,
		damage_type = damage_types.metal_slashing_light,
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.melee_attack_speed
		}
	},
	action_right_light_pushfollow = {
		damage_window_start = 0.35,
		hit_armor_anim = "attack_hit_shield",
		anim_end_event = "attack_finished",
		range_mod = 1.25,
		kind = "sweep",
		weapon_handling_template = "time_scale_1",
		damage_window_end = 0.45,
		anim_event = "attack_swing_right_diagonal",
		power_level = 500,
		total_time = 2,
		action_movement_curve = {
			{
				modifier = 1,
				t = 0.2
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
			start_attack = {
				action_name = "action_melee_start_left_2",
				chain_time = 0.4
			},
			block = {
				action_name = "action_block",
				chain_time = 0.55
			}
		},
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		weapon_box = default_weapon_box,
		spline_settings = {
			matrices_data_location = "content/characters/player/human/first_person/animations/combat_sword/swing_right_diagonal",
			anchor_point_offset = {
				0,
				0,
				-0.2
			}
		},
		damage_profile = DamageProfileTemplates.light_combatsword_linesman,
		damage_type = damage_types.metal_slashing_light,
		stat_buff_keywords = {
			buff_stat_buffs.attack_speed,
			buff_stat_buffs.melee_attack_speed
		}
	},
	action_push = {
		push_radius = 2.5,
		block_duration = 0.5,
		kind = "push",
		anim_event = "attack_push",
		power_level = 500,
		total_time = 1,
		action_movement_curve = {
			{
				modifier = 1.4,
				t = 0.1
			},
			{
				modifier = 0.5,
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
			combat_ability = {
				action_name = "combat_ability"
			},
			grenade_ability = {
				action_name = "grenade_ability"
			},
			wield = {
				action_name = "action_unwield"
			},
			push_follow_up = {
				action_name = "action_right_light_pushfollow",
				chain_time = 0.25
			},
			block = {
				action_name = "action_block",
				chain_time = 0.3
			}
		},
		inner_push_rad = math.pi * 0.6,
		outer_push_rad = math.pi * 1,
		inner_damage_profile = DamageProfileTemplates.push_test,
		inner_damage_type = damage_types.punch,
		outer_damage_profile = DamageProfileTemplates.push_test,
		outer_damage_type = damage_types.punch
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

table.add_missing(weapon_template.actions, BaseTemplateSettings.actions)

weapon_template.anim_state_machine_3p = "content/characters/player/human/third_person/animations/power_sword"
weapon_template.anim_state_machine_1p = "content/characters/player/human/first_person/animations/combat_sword"
weapon_template.weapon_box = {
	0.1,
	0.7,
	0.02
}
weapon_template.uses_ammunition = false
weapon_template.uses_overheat = false
weapon_template.sprint_ready_up_time = 0.3
weapon_template.max_first_person_anim_movement_speed = 5.8
weapon_template.ammo_template = "no_ammo"
weapon_template.fx_sources = {
	_block = "fx_block",
	_sweep = "fx_sweep"
}
weapon_template.crosshair_type = "dot"
weapon_template.hit_marker_type = "center"
weapon_template.keywords = {
	"melee",
	"combat_sword",
	"p1"
}
weapon_template.smart_targeting_template = SmartTargetingTemplates.default_melee
weapon_template.dodge_template = "default"
weapon_template.sprint_template = "default"
weapon_template.stamina_template = "default"
weapon_template.toughness_template = "default"
weapon_template.movement_curve_modifier_template = "chainsword_p1_m1"
weapon_template.footstep_intervals = {
	crouch_walking = 0.61,
	walking = 0.4,
	sprinting = 0.37
}
weapon_template.overclocks = {
	cleave_damage_up_dps_down = {
		combatsword_p1_m1_cleave_damage_stat = 0.1,
		combatsword_p1_m1_dps_stat = -0.1
	},
	finesse_up_cleave_damage_down = {
		combatsword_p1_m1_cleave_damage_stat = -0.2,
		combatsword_p1_m1_finesse_stat = 0.2
	},
	cleave_targets_up_cleave_damage_down = {
		combatsword_p1_m1_cleave_targets_stat = 0.1,
		combatsword_p1_m1_cleave_damage_stat = -0.1
	},
	mobility_up_cleave_targets_down = {
		combatsword_p1_m1_cleave_targets_stat = -0.1,
		combatsword_p1_m1_mobility_stat = 0.1
	},
	dps_up_mobility_down = {
		combatsword_p1_m1_dps_stat = 0.1,
		combatsword_p1_m1_mobility_stat = -0.1
	}
}
weapon_template.base_stats = {
	combatsword_p1_m1_dps_stat = {
		display_name = "loc_stats_display_damage_stat",
		is_stat_trait = true,
		damage = {
			action_left_light = {
				damage_trait_templates.combatsword_dps_stat
			},
			action_left_heavy = {
				damage_trait_templates.combatsword_dps_stat
			},
			action_right_light = {
				damage_trait_templates.combatsword_dps_stat
			},
			action_right_heavy = {
				damage_trait_templates.combatsword_dps_stat
			},
			action_left_light_2 = {
				damage_trait_templates.combatsword_dps_stat
			},
			action_attack_special = {
				damage_trait_templates.combatsword_dps_stat
			},
			action_right_light_pushfollow = {
				damage_trait_templates.combatsword_dps_stat
			}
		}
	},
	combatsword_p1_m1_cleave_damage_stat = {
		display_name = "loc_stats_display_cleave_damage_stat",
		is_stat_trait = true,
		damage = {
			action_left_light = {
				damage_trait_templates.combatsword_cleave_damage_stat
			},
			action_left_heavy = {
				damage_trait_templates.combatsword_cleave_damage_stat
			},
			action_right_light = {
				damage_trait_templates.combatsword_cleave_damage_stat
			},
			action_right_heavy = {
				damage_trait_templates.combatsword_cleave_damage_stat
			},
			action_left_light_2 = {
				damage_trait_templates.combatsword_cleave_damage_stat
			},
			action_attack_special = {
				damage_trait_templates.combatsword_cleave_damage_stat
			},
			action_right_light_pushfollow = {
				damage_trait_templates.combatsword_cleave_damage_stat
			}
		}
	},
	combatsword_p1_m1_finesse_stat = {
		display_name = "loc_stats_display_finesse_stat",
		is_stat_trait = true,
		damage = {
			action_left_light = {
				damage_trait_templates.combatsword_finesse_stat
			},
			action_left_heavy = {
				damage_trait_templates.combatsword_finesse_stat
			},
			action_right_light = {
				damage_trait_templates.combatsword_finesse_stat
			},
			action_right_heavy = {
				damage_trait_templates.combatsword_finesse_stat
			},
			action_left_light_2 = {
				damage_trait_templates.combatsword_finesse_stat
			},
			action_attack_special = {
				damage_trait_templates.combatsword_finesse_stat
			},
			action_right_light_pushfollow = {
				damage_trait_templates.combatsword_finesse_stat
			}
		},
		weapon_handling = {
			action_left_light = {
				weapon_handling_trait_templates.default_finesse_stat
			},
			action_left_heavy = {
				weapon_handling_trait_templates.default_finesse_stat
			},
			action_right_light = {
				weapon_handling_trait_templates.default_finesse_stat
			},
			action_right_heavy = {
				weapon_handling_trait_templates.default_finesse_stat
			},
			action_left_light_2 = {
				weapon_handling_trait_templates.default_finesse_stat
			},
			action_attack_special = {
				weapon_handling_trait_templates.default_finesse_stat
			},
			action_right_light_pushfollow = {
				weapon_handling_trait_templates.default_finesse_stat
			}
		}
	},
	combatsword_p1_m1_cleave_targets_stat = {
		display_name = "loc_stats_display_cleave_targets_stat",
		is_stat_trait = true,
		damage = {
			action_left_light = {
				damage_trait_templates.combatsword_cleave_targets_stat
			},
			action_left_heavy = {
				damage_trait_templates.combatsword_cleave_targets_stat
			},
			action_right_light = {
				damage_trait_templates.combatsword_cleave_targets_stat
			},
			action_right_heavy = {
				damage_trait_templates.combatsword_cleave_targets_stat
			},
			action_left_light_2 = {
				damage_trait_templates.combatsword_cleave_targets_stat
			},
			action_attack_special = {
				damage_trait_templates.combatsword_cleave_targets_stat
			},
			action_right_light_pushfollow = {
				damage_trait_templates.combatsword_cleave_targets_stat
			}
		}
	},
	combatsword_p1_m1_mobility_stat = {
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
		}
	}
}
weapon_template.traits = {}
local melee_common_traits = table.keys(WeaponTraitsMeleeCommon)

table.append(weapon_template.traits, melee_common_traits)

weapon_template.perks = {
	combatsword_p1_m1_dps_perk = {
		description = "loc_trait_description_combatsword_p1_m1_dps_perk",
		display_name = "loc_trait_display_combatsword_p1_m1_dps_perk",
		damage = {
			action_left_light = {
				damage_trait_templates.combatsword_dps_perk
			},
			action_left_heavy = {
				damage_trait_templates.combatsword_dps_perk
			},
			action_right_light = {
				damage_trait_templates.combatsword_dps_perk
			},
			action_right_heavy = {
				damage_trait_templates.combatsword_dps_perk
			},
			action_right_light_pushfollow = {
				damage_trait_templates.combatsword_dps_perk
			}
		}
	},
	combatsword_p1_m1_cleave_damage_perk = {
		description = "loc_trait_description_combatsword_p1_m1_cleave_damage_perk",
		display_name = "loc_trait_display_combatsword_p1_m1_cleave_damage_perk",
		damage = {
			action_left_light = {
				damage_trait_templates.combatsword_cleave_damage_perk
			},
			action_left_heavy = {
				damage_trait_templates.combatsword_cleave_damage_perk
			},
			action_right_light = {
				damage_trait_templates.combatsword_cleave_damage_perk
			},
			action_right_heavy = {
				damage_trait_templates.combatsword_cleave_damage_perk
			},
			action_right_light_pushfollow = {
				damage_trait_templates.combatsword_cleave_damage_perk
			}
		}
	},
	combatsword_p1_m1_finesse_perk = {
		description = "loc_trait_description_combatsword_p1_m1_finesse_perk",
		display_name = "loc_trait_display_combatsword_p1_m1_finesse_perk",
		damage = {
			action_left_light = {
				damage_trait_templates.combatsword_finesse_perk
			},
			action_left_heavy = {
				damage_trait_templates.combatsword_finesse_perk
			},
			action_right_light = {
				damage_trait_templates.combatsword_finesse_perk
			},
			action_right_heavy = {
				damage_trait_templates.combatsword_finesse_perk
			},
			action_right_light_pushfollow = {
				damage_trait_templates.combatsword_finesse_perk
			}
		},
		weapon_handling = {
			action_left_light = {
				weapon_handling_trait_templates.default_finesse_perk
			},
			action_left_heavy = {
				weapon_handling_trait_templates.default_finesse_perk
			},
			action_right_light = {
				weapon_handling_trait_templates.default_finesse_perk
			},
			action_right_heavy = {
				weapon_handling_trait_templates.default_finesse_perk
			},
			action_right_light_pushfollow = {
				weapon_handling_trait_templates.default_finesse_perk
			}
		}
	},
	combatsword_p1_m1_cleave_targets_perk = {
		description = "loc_trait_description_combatsword_p1_m1_cleave_targets_perk",
		display_name = "loc_trait_display_combatsword_p1_m1_cleave_targets_perk",
		damage = {
			action_left_light = {
				damage_trait_templates.combatsword_cleave_targets_perk
			},
			action_left_heavy = {
				damage_trait_templates.combatsword_cleave_targets_perk
			},
			action_right_light = {
				damage_trait_templates.combatsword_cleave_targets_perk
			},
			action_right_heavy = {
				damage_trait_templates.combatsword_cleave_targets_perk
			},
			action_right_light_pushfollow = {
				damage_trait_templates.combatsword_cleave_targets_perk
			}
		}
	},
	combatsword_p1_m1_mobility_perk = {
		description = "loc_trait_description_combatsword_p1_m1_mobility_perk",
		display_name = "loc_trait_display_combatsword_p1_m1_mobility_perk",
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
		}
	}
}

return weapon_template