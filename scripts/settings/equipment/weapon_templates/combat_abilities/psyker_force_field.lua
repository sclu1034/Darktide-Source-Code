local BuffSettings = require("scripts/settings/buff/buff_settings")
local PlayerCharacterConstants = require("scripts/settings/player_character/player_character_constants")
local SmartTargetingTemplates = require("scripts/settings/equipment/smart_targeting_templates")
local buff_keywords = BuffSettings.keywords
local wield_inputs = PlayerCharacterConstants.wield_inputs
local weapon_template = {
	action_inputs = {
		aim_force_field = {
			buffer_time = 0
		},
		place_force_field = {
			buffer_time = 0.6,
			input_sequence = {
				{
					value = true,
					input = "action_one_pressed"
				}
			}
		},
		cancel = {
			buffer_time = 0,
			clear_input_queue = true,
			input_sequence = {
				{
					value = true,
					input = "combat_ability_pressed"
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
		unwield_to_previous = {
			buffer_time = 0
		},
		grenade_ability = {
			buffer_time = 0,
			clear_input_queue = true,
			input_sequence = {
				{
					value = true,
					input = "grenade_ability_pressed"
				}
			}
		}
	},
	action_input_hierarchy = {
		grenade_ability = "stay",
		wield = "stay",
		place_force_field = "stay",
		cancel = "stay",
		unwield_to_previous = "stay",
		aim_force_field = {
			place_force_field = "base",
			wield = "base",
			cancel = "base",
			grenade_ability = "base"
		}
	},
	actions = {
		action_unwield = {
			continue_sprinting = true,
			allowed_during_sprint = true,
			start_input = "wield",
			uninterruptible = true,
			kind = "unwield",
			total_time = 0,
			allowed_chain_actions = {}
		},
		action_unwield_to_previous = {
			allowed_during_sprint = true,
			uninterruptible = true,
			kind = "unwield_to_previous",
			unwield_to_weapon = true,
			total_time = 0,
			allowed_chain_actions = {}
		},
		action_wield = {
			kind = "wield",
			uninterruptible = true,
			anim_event = "equip",
			total_time = 0.5,
			conditional_state_to_action_input = {
				auto_chain = {
					input_name = "aim_force_field"
				}
			},
			allowed_chain_actions = {
				aim_force_field = {
					action_name = "action_aim_force_field"
				}
			}
		},
		action_aim_force_field = {
			visual_unit = "content/characters/player/human/attachments_combat/psyker_shield/shield_visual",
			uninterruptible = true,
			allowed_during_sprint = false,
			kind = "aim_place",
			total_time = math.huge,
			place_configuration = {
				rotation_steps = 4,
				allow_rotation = true,
				distance = 10,
				rotation_input = "action_two_pressed"
			},
			action_movement_curve = {
				{
					modifier = 0.7,
					t = 0.1
				},
				{
					modifier = 0.55,
					t = 0.25
				},
				{
					modifier = 0.3,
					t = 0.4
				},
				start_modifier = 1
			},
			allowed_chain_actions = {
				wield = {
					action_name = "action_unwield"
				},
				place_force_field = {
					action_name = "action_place_force_field",
					chain_time = 0.5
				},
				cancel = {
					action_name = "action_cancel"
				},
				grenade_ability = {
					action_name = "action_grenade_ability"
				}
			}
		},
		action_place_force_field = {
			uninterruptible = true,
			ability_type = "combat_ability",
			allowed_during_sprint = false,
			kind = "place_force_field",
			use_ability_charge = true,
			functional_unit = "content/characters/player/human/attachments_combat/psyker_shield/shield",
			total_time = 0.4,
			action_movement_curve = {
				{
					modifier = 0.4,
					t = 0.1
				},
				{
					modifier = 0.6,
					t = 0.2
				},
				{
					modifier = 0.8,
					t = 0.3
				},
				{
					modifier = 1,
					t = 0.4
				},
				start_modifier = 0.3
			}
		},
		action_cancel = {
			start_input = "cancel",
			anim_end_event = "attack_finished",
			kind = "dummy",
			uninterruptible = true,
			anim_event = "attack_shoot",
			anim_time_scale = 1,
			total_time = 0.5,
			action_movement_curve = {
				{
					modifier = 0.5,
					t = 0.2
				},
				{
					modifier = 0.4,
					t = 0.3
				},
				{
					modifier = 1,
					t = 0.5
				},
				start_modifier = 0.8
			},
			conditional_state_to_action_input = {
				auto_chain = {
					input_name = "unwield_to_previous"
				}
			},
			allowed_chain_actions = {
				unwield_to_previous = {
					action_name = "action_unwield_to_previous"
				}
			}
		},
		action_grenade_ability = {
			slot_to_wield = "slot_grenade_ability",
			start_input = "grenade_ability",
			uninterruptible = true,
			kind = "unwield_to_specific",
			total_time = 0,
			allowed_chain_actions = {}
		}
	},
	keywords = {
		"psyker"
	},
	conditional_state_to_action_input = {
		{
			conditional_state = "no_running_action",
			input_name = "cancel"
		}
	},
	anim_state_machine_3p = "content/characters/player/human/third_person/animations/chain_lightning",
	anim_state_machine_1p = "content/characters/player/human/first_person/animations/chain_lightning",
	spread_template = "no_spread",
	ammo_template = "no_ammo",
	uses_ammunition = false,
	uses_overheat = false,
	sprint_ready_up_time = 0.1,
	max_first_person_anim_movement_speed = 5.8,
	crosshair_type = "cross",
	hit_marker_type = "center",
	fx_sources = {
		_muzzle = "fx_right"
	},
	dodge_template = "default",
	sprint_template = "default",
	stamina_template = "default",
	toughness_template = "default",
	footstep_intervals = {
		crouch_walking = 0.61,
		walking = 0.4,
		sprinting = 0.37
	}
}

return weapon_template