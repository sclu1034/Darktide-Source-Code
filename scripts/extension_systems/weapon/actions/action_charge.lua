require("scripts/extension_systems/weapon/actions/action_weapon_base")

local ActionModules = require("scripts/extension_systems/weapon/actions/modules/action_modules")
local ActionCharge = class("ActionCharge", "ActionWeaponBase")

ActionCharge.init = function (self, action_context, action_params, action_settings)
	ActionCharge.super.init(self, action_context, action_params, action_settings)

	local player_unit = self._player_unit
	local first_person_unit = self._first_person_unit
	local physics_world = self._physics_world
	local unit_data_extension = action_context.unit_data_extension
	local action_module_charge_component = unit_data_extension:write_component("action_module_charge")
	self._action_module_charge_component = action_module_charge_component
	self._charge_module = ActionModules.charge:new(physics_world, player_unit, first_person_unit, action_module_charge_component, action_settings)
	local weapon = action_params.weapon
	self._fx_sources = weapon.fx_sources
end

ActionCharge.start = function (self, action_settings, t, time_scale, action_start_params)
	ActionCharge.super.start(self, action_settings, t, time_scale, action_start_params)

	local weapon_tweak_templates_component = self._weapon_tweak_templates_component
	local weapon_template = self._weapon_template
	weapon_tweak_templates_component.spread_template_name = action_settings.spread_template or weapon_template.spread_template or "none"
	weapon_tweak_templates_component.recoil_template_name = action_settings.recoil_template or weapon_template.recoil_template or "none"
	weapon_tweak_templates_component.sway_template_name = action_settings.sway_template or weapon_template.sway_template or "none"
	weapon_tweak_templates_component.charge_template_name = action_settings.charge_template or weapon_template.charge_template or "none"
	local charge_template = self._weapon_extension:charge_template()
	local fx_extension = self._fx_extension
	self._action_module_charge_component.max_charge = 1

	if charge_template and charge_template.charge_on_action_start then
		self._charge_module:start(t)
	end

	local charge_effects = action_settings.charge_effects

	if charge_effects then
		local fx_sources = self._fx_sources
		local looping_sound_alias = charge_effects.looping_sound_alias

		if looping_sound_alias then
			local sfx_source_name = charge_effects.sfx_source_name
			local sfx_source = fx_sources[sfx_source_name]

			fassert(sfx_source, "Missing sfx_source!")
			fx_extension:trigger_looping_wwise_event(looping_sound_alias, sfx_source)

			self._looping_sound_alias = looping_sound_alias
		end

		local looping_effect_alias = charge_effects.looping_effect_alias

		if looping_effect_alias then
			local vfx_source_name = charge_effects.vfx_source_name
			local vfx_source = fx_sources[vfx_source_name]

			fassert(vfx_source, "Missing vfx_source!")
			fx_extension:spawn_looping_particles(looping_effect_alias, vfx_source)

			self._looping_effect_alias = looping_effect_alias
		end
	end
end

ActionCharge.fixed_update = function (self, dt, t, time_in_action)
	self._charge_module:fixed_update(dt, t)
end

ActionCharge.finish = function (self, reason, data, t, time_in_action)
	ActionCharge.super.finish(self, reason, data, t, time_in_action)
	self._charge_module:finish(reason, data, t)

	local fx_extension = self._fx_extension
	local looping_sound_alias = self._looping_sound_alias

	if looping_sound_alias then
		fx_extension:stop_looping_wwise_event(looping_sound_alias)
	end

	local looping_effect_alias = self._looping_effect_alias

	if looping_effect_alias then
		fx_extension:stop_looping_particles(looping_effect_alias, true)
	end

	if reason ~= "new_interrupting_action" then
		self._weapon_tweak_templates_component.spread_template_name = self._weapon_template.spread_template or "none"
	end
end

ActionCharge.running_action_state = function (self, t, time_in_action)
	local charge_level = self._action_module_charge_component.charge_level
	local charge_template = self._weapon_extension:charge_template()
	local fully_charged_charge_level = charge_template.fully_charged_charge_level or 1

	if charge_level >= fully_charged_charge_level then
		return "fully_charged"
	end

	return nil
end

return ActionCharge