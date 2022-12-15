local MATERIAL_VARIABLE = "emissive_pulse"
local PULSE_VARIABLE = "pulse_speed"
local PULSE_SPEED = 9
local WEAKSPOT_COLOR_EXTRA = {
	0.104,
	0.036,
	0,
	0.35
}
local WEAKSPOT_COLOR_DEFAULT = {
	0.104,
	0.036,
	0,
	0.2
}
local effect_template = {
	name = "chaos_beast_of_nurgle_weakspot",
	start = function (template_data, template_context)
		local unit = template_data.unit

		Unit.set_scalar_for_materials_in_unit_and_childs(unit, MATERIAL_VARIABLE, 0.5)
		Unit.set_scalar_for_materials_in_unit_and_childs(unit, PULSE_VARIABLE, PULSE_SPEED)
		Unit.set_vector4_for_materials(unit, MATERIAL_VARIABLE, Color(WEAKSPOT_COLOR_EXTRA[1], WEAKSPOT_COLOR_EXTRA[2], WEAKSPOT_COLOR_EXTRA[3], WEAKSPOT_COLOR_EXTRA[4]), true)
	end,
	update = function (template_data, template_context, dt, t)
		return
	end,
	stop = function (template_data, template_context)
		local unit = template_data.unit

		Unit.set_scalar_for_materials_in_unit_and_childs(unit, MATERIAL_VARIABLE, 0)
		Unit.set_vector4_for_materials(unit, MATERIAL_VARIABLE, Color(WEAKSPOT_COLOR_DEFAULT[1], WEAKSPOT_COLOR_DEFAULT[2], WEAKSPOT_COLOR_DEFAULT[3], WEAKSPOT_COLOR_DEFAULT[4]), true)
	end
}

return effect_template
