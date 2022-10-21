local UIFontSettings = require("scripts/managers/ui/ui_font_settings")
local UIWidget = require("scripts/managers/ui/ui_widget")
local UIWorkspaceSettings = require("scripts/settings/ui/ui_workspace_settings")
local WalletSettings = require("scripts/settings/wallet_settings")
local scenegraph_definition = {
	screen = UIWorkspaceSettings.screen
}
local widget_definitions = {}
local input_legend_params = {}
local intro_texts = {
	description_text = "loc_credits_vendor_view_intro_description",
	title_text = "loc_credits_vendor_view_intro_title"
}
local button_options_definitions = {
	{
		display_name = "loc_credits_vendor_view_option_buy",
		callback = function (self)
			local tab_bar_params = {
				layer = 10,
				tabs_params = {
					{
						view = "credits_vendor_view",
						display_name = "loc_credits_vendor_view_title"
					}
				}
			}

			self:_setup_tab_bar(tab_bar_params, {
				fetch_store_items_on_enter = true
			})
		end
	}
}
local background_world_params = {
	shading_environment = "content/shading_environments/ui/credits_vendor",
	world_layer = 1,
	total_blur_duration = 0.5,
	timer_name = "ui",
	viewport_type = "default",
	register_camera_event = "event_register_credits_vendor_camera",
	viewport_name = "ui_credits_vendor_world_viewport",
	viewport_layer = 1,
	level_name = "content/levels/ui/credits_vendor/credits_vendor",
	world_name = "ui_credits_vendor_world"
}

return {
	intro_texts = intro_texts,
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	button_options_definitions = button_options_definitions,
	input_legend_params = input_legend_params,
	background_world_params = background_world_params
}