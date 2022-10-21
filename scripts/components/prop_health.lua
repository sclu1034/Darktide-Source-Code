local PropHealth = component("PropHealth")

PropHealth.init = function (self, unit, is_server)
	self._unit = unit

	Unit.set_data(unit, "hit_mass", self:get_data(unit, "hit_mass"))

	local health_extension = ScriptUnit.fetch_component_extension(unit, "health_system")

	if health_extension then
		local max_health = self:get_data(unit, "max_health")
		local invulnerable = self:get_data(unit, "invulnerable")
		local unkillable = self:get_data(unit, "unkillable")
		local breed_white_list = self:get_data(unit, "breed_white_list")
		local ignored_colliders = self:get_data(unit, "ignored_colliders")
		local speed_on_hit = self:get_data(unit, "speed_on_hit")

		health_extension:setup_from_component(max_health, invulnerable, unkillable, breed_white_list, ignored_colliders, speed_on_hit)
	end
end

PropHealth.editor_init = function (self)
	return
end

PropHealth.enable = function (self, unit)
	return
end

PropHealth.disable = function (self, unit)
	return
end

PropHealth.destroy = function (self, unit)
	return
end

PropHealth.component_data = {
	max_health = {
		ui_type = "number",
		decimals = 0,
		value = 100,
		ui_name = "Max Health",
		step = 1
	},
	invulnerable = {
		ui_type = "check_box",
		value = false,
		ui_name = "Invulnerable"
	},
	unkillable = {
		ui_type = "check_box",
		value = false,
		ui_name = "Unkillable"
	},
	breed_white_list = {
		ui_type = "text_box_array",
		is_optional = true,
		ui_name = "Breed Whitelist",
		category = "Ignores"
	},
	ignored_colliders = {
		ui_type = "text_box_array",
		is_optional = true,
		ui_name = "Ignored Colliders",
		category = "Ignores"
	},
	hit_mass = {
		ui_type = "number",
		value = 0,
		ui_name = "Hit Mass",
		category = "Debris"
	},
	speed_on_hit = {
		ui_type = "number",
		min = 0,
		category = "Debris",
		value = 5,
		ui_name = "Impulse Speed on Hit"
	},
	extensions = {
		"PropHealthExtension"
	}
}

return PropHealth