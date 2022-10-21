require("scripts/extension_systems/outline/player_unit_outline_extension")

local OutlineSettings = require("scripts/settings/outline/outline_settings")
local OutlineSystem = class("OutlineSystem", "ExtensionSystemBase")
OutlineSystem.system_extensions = {
	"MinionOutlineExtension",
	"PropOutlineExtension",
	"PlayerUnitOutlineExtension"
}

OutlineSystem.init = function (self, context, system_init_data, system_name, _, ...)
	local extensions = OutlineSystem.system_extensions

	OutlineSystem.super.init(self, context, system_init_data, system_name, extensions, ...)

	self._unit_extension_data = {}
	self._total_num_outlines = 0
	self._visible = true
	self._color_blind_mode = "off"

	Managers.event:register(self, "event_smart_tag_created", "_event_smart_tag_created")
	Managers.event:register(self, "event_smart_tag_removed", "_event_smart_tag_removed")
end

OutlineSystem.destroy = function (self)
	Managers.event:unregister(self, "event_smart_tag_created")
	Managers.event:unregister(self, "event_smart_tag_removed")
	OutlineSystem.super.destroy(self)
end

OutlineSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data, ...)
	local settings = OutlineSettings[extension_name]

	fassert(settings, "No outline settings found for extension %s", extension_name)

	local extension = nil

	if extension_name == "PlayerUnitOutlineExtension" then
		extension = OutlineSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data, ...)
	elseif extension_name == "MinionOutlineExtension" or extension_name == "PropOutlineExtension" then
		extension = {}

		ScriptUnit.set_extension(unit, "outline_system", extension)
	end

	extension.name = extension_name
	extension.settings = settings
	extension.outlines = {}
	extension.visible_material_layers = nil
	self._unit_extension_data[unit] = extension

	return extension
end

local function _set_material_layers(unit, material_layers, enabled)
	for i = 1, #material_layers do
		local layer = material_layers[i]

		Unit.set_material_layer(unit, layer, enabled)
	end

	Unit.set_unit_culling(unit, not enabled, true)
end

OutlineSystem.on_remove_extension = function (self, unit, extension_name)
	local extension = self._unit_extension_data[unit]
	local visible_material_layers = extension.visible_material_layers

	if visible_material_layers then
		_set_material_layers(unit, visible_material_layers, false)
	end

	self._total_num_outlines = self._total_num_outlines - #extension.outlines
	self._unit_extension_data[unit] = nil

	if extension_name == "PlayerUnitOutlineExtension" then
		OutlineSystem.super.on_remove_extension(self, unit, extension_name)
	elseif extension_name == "MinionOutlineExtension" or extension_name == "PropOutlineExtension" then
		ScriptUnit.remove_extension(unit, self.NAME)
	end
end

local function _find_outline(outlines, name)
	for i = 1, #outlines do
		if outlines[i].name == name then
			return i
		end
	end
end

local function _sort_outlines_by_priority(o1, o2)
	return o1.priority < o2.priority
end

OutlineSystem.add_outline = function (self, unit, outline_name)
	local extension = self._unit_extension_data[unit]

	if not extension then
		Log.info("OutlineSystem", "Extension not found for unit %s", unit)

		return
	end

	local setting = extension.settings[outline_name]

	if not setting then
		Log.info("OutlineSystem", "Outline %s not found for %s, ignoring it", outline_name, extension.name)

		return
	end

	local outlines = extension.outlines

	if _find_outline(outlines, outline_name) then
		return
	end

	outlines[#outlines + 1] = {
		name = outline_name,
		priority = setting.priority,
		material_layers = setting.material_layers,
		visibility_check = setting.visibility_check
	}

	table.sort(outlines, _sort_outlines_by_priority)

	self._total_num_outlines = self._total_num_outlines + 1
	local top_outline = outlines[1]

	if top_outline.name == outline_name then
		self:_hide_outline(unit, extension)
	end
end

OutlineSystem.remove_outline = function (self, unit, outline_name)
	local extension = self._unit_extension_data[unit]

	if not extension then
		return
	end

	local outlines = extension.outlines
	local remove_index = _find_outline(outlines, outline_name)

	if not remove_index then
		return
	end

	table.remove(outlines, remove_index)

	self._total_num_outlines = self._total_num_outlines - 1

	if remove_index == 1 then
		self:_hide_outline(unit, extension)
	end
end

OutlineSystem.remove_all_outlines = function (self, unit)
	local extension = self._unit_extension_data[unit]

	if not extension then
		return
	end

	local outlines = extension.outlines
	local num_outlines = #outlines

	if num_outlines > 0 then
		self:_hide_outline(unit, extension)
		table.clear(outlines)

		self._total_num_outlines = self._total_num_outlines - num_outlines
	end
end

OutlineSystem.update = function (self, context, dt, t)
	for unit, extension in pairs(self._unit_extension_data) do
		if extension.update then
			extension:update(unit, dt, t)
		end
	end

	if self._total_num_outlines == 0 then
		return
	end

	local visible = self._visible
	local visible_new = self:_check_global_visibility()

	if visible and not visible_new then
		for unit, extension in pairs(self._unit_extension_data) do
			self:_hide_outline(unit, extension)
		end

		self._visible = false

		return
	elseif not visible and visible_new then
		for unit, extension in pairs(self._unit_extension_data) do
			self:_show_outline(unit, extension)
		end

		self._visible = true

		return
	end

	if not visible then
		return
	end

	for unit, extension in pairs(self._unit_extension_data) do
		local top_outline = extension.outlines[1]

		if top_outline then
			local visible_material_layers = extension.visible_material_layers
			local should_show = top_outline.visibility_check(unit)

			if visible_material_layers and not should_show then
				_set_material_layers(unit, visible_material_layers, false)

				extension.visible_material_layers = nil
			elseif not visible_material_layers and should_show then
				_set_material_layers(unit, top_outline.material_layers, true)

				extension.visible_material_layers = top_outline.material_layers
			end
		end
	end
end

OutlineSystem._show_outline = function (self, unit, extension)
	local top_outline = extension.outlines[1]

	if top_outline and top_outline.visibility_check(unit) then
		local material_layers = top_outline.material_layers

		_set_material_layers(unit, material_layers, true)

		extension.visible_material_layers = material_layers
	end
end

OutlineSystem._hide_outline = function (self, unit, extension)
	local visible_material_layers = extension.visible_material_layers

	if visible_material_layers then
		_set_material_layers(unit, visible_material_layers, false)

		extension.visible_material_layers = nil
	end
end

OutlineSystem._check_global_visibility = function (self)
	if self:_cinematic_active() then
		return false
	end

	return true
end

OutlineSystem._cinematic_active = function (self)
	local extension_manager = Managers.state.extension
	local cinematic_scene_system = extension_manager:system("cinematic_scene_system")
	local cinematic_scene_system_active = cinematic_scene_system:is_active()
	local cinematic_manager = Managers.state.cinematic
	local cinematic_manager_active = cinematic_manager:active()

	return cinematic_scene_system_active or cinematic_manager_active
end

OutlineSystem._smart_tag_unit_outline = function (self, tag_instance)
	local target_unit = tag_instance:target_unit()

	if target_unit and self._unit_extension_data[target_unit] then
		local outline_name = tag_instance:target_unit_outline()

		if outline_name then
			return target_unit, outline_name
		end
	end
end

OutlineSystem._event_smart_tag_created = function (self, tag_instance, is_hotjoin_synced)
	local unit, outline_name = self:_smart_tag_unit_outline(tag_instance)

	if unit then
		self:add_outline(unit, outline_name)
	end
end

OutlineSystem._event_smart_tag_removed = function (self, tag_instance, reason)
	local unit, outline_name = self:_smart_tag_unit_outline(tag_instance)

	if unit then
		self:remove_outline(unit, outline_name)
	end
end

OutlineSystem.trigger_outline_update = function (self, unit)
	return
end

OutlineSystem.dropping_loadout_unit = function (self, unit, loadout_unit)
	local extension = self._unit_extension_data[unit]

	if extension then
		local visible_material_layers = extension.visible_material_layers

		if visible_material_layers then
			_set_material_layers(loadout_unit, visible_material_layers, false)
		end
	end
end

return OutlineSystem