local CreditsGoodsVendorViewSettings = require("scripts/ui/views/credits_goods_vendor_view/credits_goods_vendor_view_settings")
local Definitions = require("scripts/ui/views/credits_goods_vendor_view/credits_goods_vendor_view_definitions")
local InputUtils = require("scripts/managers/input/input_utils")
local ItemUtils = require("scripts/utilities/items")
local MasterItems = require("scripts/backend/master_items")
local UIFonts = require("scripts/managers/ui/ui_fonts")
local UIRenderer = require("scripts/managers/ui/ui_renderer")
local VendorViewBase = require("scripts/ui/views/vendor_view_base/vendor_view_base")
local ViewElementItemResultOverlay = require("scripts/ui/view_elements/view_element_item_result_overlay/view_element_item_result_overlay")
local WeaponUnlockSettings = require("scripts/settings/weapon_unlock_settings")
local CreditsGoodsVendorView = class("CreditsGoodsVendorView", "VendorViewBase")

CreditsGoodsVendorView.init = function (self, settings, context)
	CreditsGoodsVendorView.super.init(self, Definitions, settings, context)

	local parent = context and context.parent
	self._parent = parent
	self._debug = context and context.debug

	if parent then
		context.parent:set_is_handling_navigation_input(true)
	end
end

CreditsGoodsVendorView.present_grid_layout = function (self, layout, on_present_callback)
	local is_loading = layout and table.size(layout) <= 0 or false

	self:set_loading_state(is_loading)

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.title_text.content.visible = not is_loading
	widgets_by_name.description_text.content.visible = not is_loading
	widgets_by_name.divider.content.visible = not is_loading

	CreditsGoodsVendorView.super.present_grid_layout(self, layout, on_present_callback)
end

CreditsGoodsVendorView._generate_menu_tabs = function (self, layout, offers)
	local definitions = self._definitions

	return definitions.item_category_tabs_content
end

CreditsGoodsVendorView._update_grid_height = function (self, use_tab_menu)
	return
end

CreditsGoodsVendorView.on_enter = function (self)
	CreditsGoodsVendorView.super.on_enter(self)
	self._item_grid:update_dividers("content/ui/materials/frames/item_list_top_hollow", {
		652,
		118
	}, {
		0,
		-18,
		20
	})
end

CreditsGoodsVendorView._setup_item_grid = function (self)
	local total_height = 0
	local widgets_by_name = self._widgets_by_name
	local title_text_widget = widgets_by_name.title_text

	if title_text_widget then
		local ui_renderer = self._ui_renderer
		local content = title_text_widget.content
		local style = title_text_widget.style
		local text_style = style.text
		local text_options = UIFonts.get_font_options_by_style(text_style)
		local _, height = UIRenderer.text_size(ui_renderer, content.text, text_style.font_type, text_style.font_size, text_style.size, text_options)
		height = height + 10

		self:_set_scenegraph_size("title_text", nil, height)

		local height_offset = 120

		self:_set_scenegraph_position("title_text", nil, height_offset)

		total_height = total_height + height + height_offset
	end

	local description_text_widget = widgets_by_name.description_text

	if description_text_widget then
		local ui_renderer = self._ui_renderer
		local content = description_text_widget.content
		local style = description_text_widget.style
		local text_style = style.text
		local text_options = UIFonts.get_font_options_by_style(text_style)
		local _, height = UIRenderer.text_size(ui_renderer, content.text, text_style.font_type, text_style.font_size, text_style.size, text_options)
		height = height + 10
		local definitions = self._definitions
		local grid_settings = definitions.grid_settings
		grid_settings.top_padding = height

		self:_set_scenegraph_size("description_text", nil, height)

		local height_offset = 0

		self:_set_scenegraph_position("description_text", nil, height + height_offset)

		total_height = total_height + height + height_offset
	end

	total_height = total_height + 40
	local definitions = self._definitions
	local grid_settings = definitions.grid_settings
	grid_settings.top_padding = total_height

	CreditsGoodsVendorView.super._setup_item_grid(self)
end

CreditsGoodsVendorView._setup_result_overlay = function (self, result_data)
	if self._result_overlay then
		self._result_overlay = nil

		self:_remove_element("result_overlay")
	end

	local reference_name = "result_overlay"
	local layer = 40
	self._result_overlay = self:_add_element(ViewElementItemResultOverlay, reference_name, layer)

	self:_update_result_overlay_position()
	self._result_overlay:start(result_data)
end

CreditsGoodsVendorView._update_result_overlay_position = function (self)
	if not self._result_overlay then
		return
	end
end

CreditsGoodsVendorView._get_store = function (self)
	local store_service = Managers.data_service.store

	return store_service:get_credits_goods_store()
end

CreditsGoodsVendorView.show_items = function (self)
	self:_clear_list()

	self._show_temporary_store_items = false

	self:_update_wallets():next(function ()
		self:_fetch_store_items()
	end)
end

CreditsGoodsVendorView._setup_sort_options = function (self)
	return
end

CreditsGoodsVendorView.cb_on_grid_entry_left_pressed = function (self, widget, element)
	local function cb_func()
		if self._destroyed then
			return
		end

		local offer = element.offer

		if Managers.ui:using_cursor_navigation() and offer and offer ~= self._previewed_offer then
			local widget_index = self._item_grid:widget_index(widget) or 1

			self._item_grid:focus_grid_index(widget_index)
		end
	end

	self._update_callback_on_grid_entry_left_pressed = callback(cb_func)
end

CreditsGoodsVendorView._convert_offers_to_layout_entries = function (self, item_offers)
	local layout = {}
	local player = self:_player()
	local profile = player:profile()
	local specialization = profile.specialization
	local archetype_weapon_unlocks = WeaponUnlockSettings[specialization]

	for i = 1, #item_offers do
		local offer = item_offers[i]
		local offer_id = offer.offerId
		local sku = offer.sku
		local category = sku.category

		if category == "item_instance" then
			local description = offer.description
			local lootChoices = description.lootChoices
			local master_id = lootChoices[1]
			local master_item = MasterItems.get_item(master_id)

			if master_item then
				local hud_icon = master_item.hud_icon
				hud_icon = hud_icon or "content/ui/materials/icons/weapons/hud/combat_blade_01"
				local display_name = master_item.display_name and Localize(master_item.display_name) or "n/a"
				local weapon_level_requirement = nil

				for weapon_level, weapon_list in ipairs(archetype_weapon_unlocks) do
					for i = 1, #weapon_list do
						local weapon_name = weapon_list[i]

						if weapon_name == master_item.name then
							weapon_level_requirement = weapon_level

							break
						end
					end

					if weapon_level_requirement ~= nil then
						break
					end
				end

				if weapon_level_requirement == nil then
					weapon_level_requirement = 1
				end

				table.insert(layout, 1, {
					widget_type = "credits_goods_item",
					offer = offer,
					offer_id = offer_id,
					icon = hud_icon,
					display_name = display_name,
					item = master_item,
					weapon_level_requirement = weapon_level_requirement
				})
			end
		end
	end

	table.sort(layout, function (a, b)
		return b.weapon_level_requirement < a.weapon_level_requirement
	end)

	return layout
end

CreditsGoodsVendorView._present_purchase_result = function (self, item)
	local result_data = {
		type = "item",
		item = item
	}

	self:_setup_result_overlay(result_data)
end

CreditsGoodsVendorView.draw = function (self, dt, t, input_service, layer)
	if self._result_overlay then
		input_service = input_service:null_service()
	end

	return CreditsGoodsVendorView.super.draw(self, dt, t, input_service, layer)
end

CreditsGoodsVendorView.update = function (self, dt, t, input_service)
	local result_overlay = self._result_overlay
	local handle_input = true

	if result_overlay then
		if result_overlay:presentation_complete() then
			self:_close_result_overlay()
		end

		handle_input = false
	end

	local pass_input, pass_draw = CreditsGoodsVendorView.super.update(self, dt, t, input_service)

	return handle_input and pass_input, pass_draw
end

CreditsGoodsVendorView._close_result_overlay = function (self)
	if self._result_overlay then
		self._result_overlay = nil

		self:_remove_element("result_overlay")
	end

	local result_item = self._result_item
	local gear_id = result_item.gear_id
	local item_type = result_item.item_type

	ItemUtils.mark_item_id_as_new(gear_id, item_type)
	Managers.event:trigger("event_vendor_view_purchased_item")
end

local _device_list = {
	Keyboard,
	Mouse,
	Pad1
}

CreditsGoodsVendorView._handle_input = function (self, input_service)
	local any_input_pressed = false

	if IS_XBS then
		local input_device_list = InputUtils.input_device_list
		local xbox_controllers = input_device_list.xbox_controller

		for i = 1, #xbox_controllers do
			local xbox_controller = xbox_controllers[i]

			if xbox_controller.active() and xbox_controller.any_released() then
				any_input_pressed = true

				break
			end
		end
	else
		for i = 1, #_device_list do
			local device = _device_list[i]

			if device and device.active and device.any_released() then
				any_input_pressed = true

				break
			end
		end
	end

	if any_input_pressed and self:_is_result_presentation_active() then
		self:_close_result_overlay()
	end

	CreditsGoodsVendorView.super._handle_input(self, input_service)
end

CreditsGoodsVendorView._on_purchase_complete = function (self, items)
	for i, item_data in ipairs(items) do
		local uuid = item_data.uuid
		local item = MasterItems.get_item_instance(item_data, uuid)

		if item then
			self:_update_wallets()
			self:_present_purchase_result(item)
		end

		self._result_item = item
	end

	if self._debug then
		return
	end

	self._parent:play_vo_events({
		"credit_store_servitor_purchase_c"
	}, "credit_store_servitor_c", nil, 1.4)
end

CreditsGoodsVendorView._is_result_presentation_active = function (self)
	if self._result_overlay then
		return true
	end

	return false
end

CreditsGoodsVendorView._preview_element = function (self, element)
	CreditsGoodsVendorView.super._preview_element(self, element)

	local icon = element and element.icon
	local display_name = element and element.display_name or "n/a"
	local widgets_by_name = self._widgets_by_name
	local info_box_widget = widgets_by_name.info_box

	if info_box_widget then
		local content = info_box_widget.content
		content.header = display_name
		content.icon = icon
	end

	local visible = true

	self:_set_preview_widgets_visibility(visible)
end

CreditsGoodsVendorView._preview_item = function (self, item)
	return
end

CreditsGoodsVendorView._set_preview_widgets_visibility = function (self, visible)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.price_text.content.visible = visible
	widgets_by_name.purchase_button.content.visible = visible
	widgets_by_name.price_icon.content.visible = visible
	widgets_by_name.info_box.content.visible = visible
end

CreditsGoodsVendorView.dialogue_system = function (self)
	if self._debug then
		return
	end

	return self._parent:dialogue_system()
end

CreditsGoodsVendorView._update_button_disable_state = function (self)
	CreditsGoodsVendorView.super._update_button_disable_state(self)

	local widgets = self._item_grid:widgets()
	local selected_grid_index = self._item_grid:selected_grid_index()

	if widgets and selected_grid_index then
		local widget = widgets[selected_grid_index]
		local button_widget = self._widgets_by_name.purchase_button

		if button_widget.content.visible then
			button_widget.content.hotspot.disabled = not button_widget.content.hotspot.disabled and not widget.content.level_requirement_met or button_widget.content.hotspot.disabled
		end
	end
end

CreditsGoodsVendorView._cb_on_purchase_pressed = function (self)
	local result_overlay = self._result_overlay
	local purchase_disabled = self._widgets_by_name.purchase_button.content.hotspot.disabled

	if result_overlay or purchase_disabled then
		return
	end

	CreditsGoodsVendorView.super._cb_on_purchase_pressed(self)
end

return CreditsGoodsVendorView