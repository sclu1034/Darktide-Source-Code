local BaseTemplateSettings = require("scripts/settings/equipment/weapon_templates/base_template_settings")
local DamageProfileTemplates = require("scripts/settings/damage/damage_profile_templates")
local PlayerCharacterConstants = require("scripts/settings/player_character/player_character_constants")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local FootstepIntervalsTemplates = require("scripts/settings/equipment/footstep/footstep_intervals_templates")
local damage_types = DamageSettings.damage_types
local wield_inputs = PlayerCharacterConstants.wield_inputs
local weapon_template = {
	action_inputs = {
		use_self = {
			buffer_time = 0.4,
			input_sequence = {
				{
					value = true,
					input = "action_one_pressed"
				}
			}
		},
		use_ally = {
			buffer_time = 0.4,
			input_sequence = {
				{
					value = true,
					input = "action_two_pressed"
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
		}
	}
}

table.add_missing(weapon_template.action_inputs, BaseTemplateSettings.action_inputs)

weapon_template.action_input_hierarchy = {
	wield = "stay",
	use_self = "stay",
	use_ally = "stay"
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
		kind = "wield",
		uninterruptible = true,
		allowed_during_sprint = true,
		anim_event_3p = "equip_syringe",
		anim_event = "equip",
		total_time = 0
	},
	action_use_self = {
		allowed_during_sprint = false,
		uninterruptible = true,
		start_input = "use_self",
		anim_end_event = "action_finished",
		kind = "dummy",
		anim_event_3p = "syringe_use_self",
		anim_event = "use_self",
		total_time = 2,
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield"
			}
		}
	},
	action_use_ally = {
		allowed_during_sprint = false,
		uninterruptible = true,
		start_input = "use_ally",
		anim_end_event = "action_finished",
		kind = "dummy",
		anim_event_3p = "syringe_use_ally",
		anim_event = "use_ally",
		total_time = 2,
		anim_end_event_condition_func = function (unit, data, end_reason)
			return end_reason ~= "new_interrupting_action" and end_reason ~= "action_complete"
		end,
		allowed_chain_actions = {
			wield = {
				action_name = "action_unwield"
			}
		}
	},
	action_inspect = {
		anim_event = "inspect_start",
		crosshair_type = "none",
		start_input = "inspect_start",
		anim_end_event = "inspect_end",
		kind = "inspect",
		lock_view = true,
		stop_input = "inspect_stop",
		total_time = math.huge
	}
}

table.add_missing(weapon_template.actions, BaseTemplateSettings.actions)

weapon_template.keywords = {
	"pocketable",
	"syringe"
}
weapon_template.ammo_template = "no_ammo"
weapon_template.breed_anim_state_machine_3p = {
	human = "content/characters/player/human/third_person/animations/pocketables",
	ogryn = "content/characters/player/ogryn/third_person/animations/pocketables"
}
weapon_template.breed_anim_state_machine_1p = {
	human = "content/characters/player/human/first_person/animations/syringe",
	ogryn = "content/characters/player/ogryn/first_person/animations/syringe"
}
weapon_template.fx_sources = {
	_passive = "fx_passive"
}
weapon_template.dodge_template = "default"
weapon_template.sprint_template = "default"
weapon_template.stamina_template = "default"
weapon_template.toughness_template = "default"
weapon_template.hud_icon = "content/ui/materials/icons/pickups/default"
weapon_template.swap_pickup_name = "syringe"
weapon_template.footstep_intervals = FootstepIntervalsTemplates.default

weapon_template.action_none_screen_ui_validation = function (wielded_slot_id, item, current_action, current_action_name, player)
	return not current_action_name or current_action_name == "none"
end

weapon_template.action_discard_screen_ui_validation = function (wielded_slot_id, item, current_action, current_action_name, player)
	return current_action_name == "action_throw"
end

return weapon_template
