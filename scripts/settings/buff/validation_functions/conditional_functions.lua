local Action = require("scripts/utilities/weapon/action")
local Sprint = require("scripts/extension_systems/character_state_machine/character_states/utilities/sprint")
local WeaponTemplate = require("scripts/utilities/weapon/weapon_template")
local ConditionalFunctions = {}

ConditionalFunctions.is_item_slot_wielded = function (template_data, template_context)
	local item_slot_name = template_context.item_slot_name

	if not item_slot_name then
		return true
	end

	if not template_data.inventory_component then
		local unit_data_extension = ScriptUnit.extension(template_context.unit, "unit_data_system")
		template_data.inventory_component = unit_data_extension:read_component("inventory")
	end

	local wielded_slot = template_data.inventory_component.wielded_slot
	local is_wielded = item_slot_name == wielded_slot

	return is_wielded
end

ConditionalFunctions.is_item_slot_not_wielded = function (template_data, template_context)
	return not ConditionalFunctions.is_item_slot_wielded(template_data, template_context)
end

ConditionalFunctions.has_full_toughness = function (tempalte_data, template_context)
	local unit = template_context.unit
	local toughness_extension = ScriptUnit.extension(unit, "toughness_system")
	local current_toughness = toughness_extension:current_toughness_percent()

	return current_toughness == 1
end

local reloading_states = {
	vent_overheat = true,
	reload_shotgun = true,
	reload_state = true
}

ConditionalFunctions.is_reloading = function (template_data, template_context)
	local unit = template_context.unit
	local unit_data_extension = ScriptUnit.extension(unit, "unit_data_system")
	local weapon_action_component = unit_data_extension:read_component("weapon_action")
	local weapon_template = WeaponTemplate.current_weapon_template(weapon_action_component)
	local _, action_setting = Action.current_action(weapon_action_component, weapon_template)
	local action_kind = action_setting and action_setting.kind
	local in_reload_action = action_kind and reloading_states[action_kind]

	return in_reload_action
end

ConditionalFunctions.is_alternative_fire = function (template_data, template_context)
	local player_unit = template_context.unit
	local unit_data_extension = ScriptUnit.has_extension(player_unit, "unit_data_system")

	if unit_data_extension then
		local alternate_fire_component = unit_data_extension:read_component("alternate_fire")
		local is_active = alternate_fire_component.is_active

		return is_active
	end
end

ConditionalFunctions.melee_weapon_special_active = function (template_data, template_context)
	local player_unit = template_context.unit
	local slot_name = template_context.item_slot_name

	if not slot_name then
		return false
	end

	local unit_data_extension = ScriptUnit.extension(player_unit, "unit_data_system")
	local inventory_slot_component = unit_data_extension:read_component(slot_name)
	local is_active = inventory_slot_component.special_active

	if DevParameters.weapon_traits_testify then
		return true
	end

	return is_active
end

ConditionalFunctions.has_high_warp_charge = function (template_data, template_context)
	local player_unit = template_context.unit
	local unit_data_extension = ScriptUnit.extension(player_unit, "unit_data_system")
	local warp_charge_component = unit_data_extension:read_component("warp_charge")
	local has_high_warp_charge = warp_charge_component.current_percentage > 0.8

	return has_high_warp_charge
end

ConditionalFunctions.has_high_overheat = function (template_data, template_context)
	local player_unit = template_context.unit
	local slot_name = template_context.item_slot_name
	local unit_data_extension = ScriptUnit.extension(player_unit, "unit_data_system")
	local inventory_slot_component = unit_data_extension:read_component(slot_name)
	local has_high_overheat = inventory_slot_component.overheat_current_percentage > 0.8

	return has_high_overheat
end

ConditionalFunctions.is_lunging = function (template_data, template_context)
	local unit = template_context.unit
	local is_player = template_context.is_player

	if not is_player then
		return false
	end

	local lunge_component = template_data.lunge_component

	if not lunge_component then
		local unit_data_extension = ScriptUnit.extension(unit, "unit_data_system")
		lunge_component = unit_data_extension:read_component("lunge_character_state")
		template_data.lunge_component = lunge_component
	end

	local is_lungeing = lunge_component.is_lunging

	return is_lungeing
end

ConditionalFunctions.is_sprinting = function (template_data, template_context)
	local unit = template_context.unit
	local is_player = template_context.is_player

	if not is_player then
		return false
	end

	local sprint_character_state_component = template_data.sprint_character_state_component

	if not sprint_character_state_component then
		local unit_data_extension = ScriptUnit.extension(unit, "unit_data_system")
		sprint_character_state_component = unit_data_extension:read_component("sprint_character_state")
		template_data.sprint_character_state_component = sprint_character_state_component
	end

	local is_sprinting = Sprint.is_sprinting(sprint_character_state_component)

	return is_sprinting
end

return ConditionalFunctions