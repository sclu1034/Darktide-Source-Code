local UIFontSettings = require("scripts/managers/ui/ui_font_settings")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local ColorUtilities = require("scripts/utilities/ui/colors")
local ListHeaderPassTemplates = require("scripts/ui/pass_templates/list_header_templates")
local UIRenderer = require("scripts/managers/ui/ui_renderer")
local ButtonPassTemplates = {}
local terminal_orange_light = Color.ui_orange_light(255, true)
local terminal_orange_medium = Color.ui_orange_medium(255, true)
local terminal_orange_dark = Color.ui_orange_dark(255, true)
local ui_brown_light = Color.ui_brown_light(255, true)
local ui_brown_medium = Color.ui_brown_medium(255, true)
local ui_brown_dark = Color.ui_brown_dark(255, true)
local color_lerp = ColorUtilities.color_lerp
local math_max = math.max
local default_button_content = {
	on_hover_sound = UISoundEvents.default_mouse_hover,
	on_pressed_sound = UISoundEvents.default_select
}
local simple_button_font_setting_name = "button_medium"
local simple_button_font_settings = UIFontSettings[simple_button_font_setting_name]
local simple_button_font_color = simple_button_font_settings.text_color
ButtonPassTemplates.simple_button = {
	{
		pass_type = "hotspot",
		content_id = "hotspot",
		content = default_button_content
	},
	{
		pass_type = "rect",
		style = {
			color = {
				200,
				160,
				160,
				160
			}
		}
	},
	{
		change_function = " style.color[1] = math.max(content.hotspot.anim_hover_progress, content.hotspot.anim_select_progress)*255 ",
		pass_type = "rect",
		style = {
			color = {
				200,
				40,
				40,
				40
			},
			offset = {
				0,
				0,
				1
			}
		}
	},
	{
		style_id = "text",
		pass_type = "text",
		value_id = "text",
		value = "Button",
		style = {
			text_vertical_alignment = "center",
			text_horizontal_alignment = "center",
			offset = {
				0,
				0,
				2
			},
			font_type = simple_button_font_settings.font_type,
			font_size = simple_button_font_settings.font_size,
			text_color = simple_button_font_color,
			default_text_color = simple_button_font_color
		},
		change_function = function (content, style)
			local default_text_color = style.default_text_color
			local text_color = style.text_color
			local progress = 1 - content.hotspot.anim_input_progress * 0.3
			text_color[2] = default_text_color[2] * progress
			text_color[3] = default_text_color[3] * progress
			text_color[4] = default_text_color[4] * progress
		end
	}
}
local default_button_text_style = table.clone(UIFontSettings.button_primary)
default_button_text_style.offset = {
	0,
	0,
	4
}
default_button_text_style.text_horizontal_alignment = "center"
default_button_text_style.text_vertical_alignment = "center"
default_button_text_style.character_spacing = 0.1
local ready_button_text_style = table.clone(UIFontSettings.header_2)
ready_button_text_style.offset = {
	0,
	-6,
	4
}
ready_button_text_style.text_horizontal_alignment = "center"
ready_button_text_style.text_vertical_alignment = "center"
ready_button_text_style.material = "content/ui/materials/font_gradients/slug_font_gradient_header"
ready_button_text_style.font_type = "proxima_nova_bold"
ready_button_text_style.text_color = Color.white(255, true)
ready_button_text_style.font_size = 30
local ready_hover_text_style = table.clone(UIFontSettings.header_2)
ready_hover_text_style.offset = {
	0,
	-6,
	5
}
ready_hover_text_style.text_horizontal_alignment = "center"
ready_hover_text_style.text_vertical_alignment = "center"
ready_hover_text_style.default_color = Color.white(0, true)
ready_hover_text_style.font_type = "proxima_nova_bold"
ready_hover_text_style.hover_color = Color.white(255, true)
ready_hover_text_style.font_size = 30
local url_text_style = table.clone(UIFontSettings.body)
url_text_style.text_horizontal_alignment = "center"
url_text_style.text_vertical_alignment = "center"
url_text_style.default_color = Color.ui_terminal(255, true)
url_text_style.font_type = "proxima_nova_bold"
url_text_style.hover_color = Color.white(255, true)
ButtonPassTemplates.url_button = {
	{
		pass_type = "hotspot",
		content_id = "hotspot",
		content = default_button_content
	},
	{
		style_id = "text",
		pass_type = "text",
		value_id = "text",
		style = url_text_style,
		change_function = function (content, style)
			local hotspot = content.hotspot
			local default_color = hotspot.disabled and style.disabled_color or style.default_color
			local hover_color = style.hover_color
			local text_color = style.text_color
			local progress = math.max(math.max(hotspot.anim_focus_progress, hotspot.anim_select_progress), math.max(hotspot.anim_hover_progress, hotspot.anim_input_progress))

			color_lerp(default_color, hover_color, progress, text_color)
		end
	},
	{
		value = "content/ui/materials/frames/hover",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			hdr = false,
			color = Color.ui_terminal(255, true),
			size_addition = {
				20,
				20
			}
		},
		change_function = function (content, style)
			local anim_progress = math.max(math.max(content.hotspot.anim_hover_progress, content.hotspot.anim_select_progress), content.hotspot.anim_focus_progress)
			style.color[1] = anim_progress * 255
			local size_addition = style.size_addition
			local size_padding = 20 - math.easeInCubic(anim_progress) * 10
			size_addition[1] = size_padding
			size_addition[2] = size_padding
		end
	},
	size_function = function (parent, config, ui_renderer)
		local text_width, text_height = UIRenderer.text_size(ui_renderer, Localize(config.text), url_text_style.font_type, url_text_style.font_size)

		return {
			text_width,
			text_height
		}
	end,
	init = function (parent, widget, ui_renderer, options)
		widget.content.text = string.format("{#under(true)}%s{#under(false)}", options.text)
	end
}
ButtonPassTemplates.default_button = {
	{
		pass_type = "hotspot",
		content_id = "hotspot",
		content = default_button_content
	},
	{
		pass_type = "rect",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			size_addition = {
				-34,
				-12
			},
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				0,
				0,
				0
			}
		}
	},
	{
		value = "content/ui/materials/buttons/background_selected",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			size_addition = {
				-34,
				-12
			},
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				1
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			style.color[1] = 100 + math.max(hotspot.anim_hover_progress, content.hotspot.anim_select_progress) * 155
		end
	},
	{
		value = "content/ui/materials/buttons/primary",
		pass_type = "texture",
		style = {
			offset = {
				0,
				0,
				2
			}
		}
	},
	{
		style_id = "text",
		pass_type = "text",
		value_id = "text",
		style = default_button_text_style,
		change_function = function (content, style)
			local hotspot = content.hotspot
			local default_color = hotspot.disabled and style.disabled_color or style.default_color
			local hover_color = style.hover_color
			local text_color = style.text_color
			local progress = math.max(math.max(hotspot.anim_focus_progress, hotspot.anim_select_progress), math.max(hotspot.anim_hover_progress, hotspot.anim_input_progress))

			color_lerp(default_color, hover_color, progress, text_color)
		end
	},
	size = {
		347,
		76
	}
}
ButtonPassTemplates.ready_button = {
	{
		pass_type = "hotspot",
		content_id = "hotspot",
		content = default_button_content
	},
	{
		pass_type = "rect",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			size_addition = {
				-160,
				-84
			},
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				0,
				0,
				0
			}
		}
	},
	{
		value = "content/ui/materials/buttons/background_selected",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			size_addition = {
				-160,
				-84
			},
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				1
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			style.color[1] = 100 + math.max(hotspot.anim_hover_progress, content.hotspot.anim_select_progress) * 155
		end
	},
	{
		value = "content/ui/materials/buttons/ready_active",
		pass_type = "texture",
		style = {
			offset = {
				0,
				0,
				2
			}
		},
		visibility_function = function (content, style)
			return content.active
		end
	},
	{
		value = "content/ui/materials/buttons/ready_idle",
		pass_type = "texture",
		style = {
			offset = {
				0,
				0,
				2
			}
		},
		visibility_function = function (content, style)
			return not content.active
		end
	},
	{
		value_id = "text",
		pass_type = "text",
		style_id = "text",
		style = ready_button_text_style
	},
	{
		style_id = "hover_text",
		pass_type = "text",
		value_id = "text",
		style = ready_hover_text_style,
		change_function = function (content, style)
			local hotspot = content.hotspot
			local default_color = hotspot.disabled and style.disabled_color or style.default_color
			local hover_color = style.hover_color
			local text_color = style.text_color
			local progress = math.max(math.max(hotspot.anim_focus_progress, hotspot.anim_select_progress), math.max(hotspot.anim_hover_progress, hotspot.anim_input_progress))

			color_lerp(default_color, hover_color, progress, text_color)
		end
	},
	size = {
		490,
		150
	}
}
local default_button_small_text_style = table.clone(UIFontSettings.button_primary)
default_button_small_text_style.offset = {
	0,
	0,
	4
}
default_button_small_text_style.text_horizontal_alignment = "center"
default_button_small_text_style.text_vertical_alignment = "center"
default_button_small_text_style.character_spacing = 0.1
default_button_small_text_style.font_size = 20
ButtonPassTemplates.default_button_small = {
	{
		pass_type = "hotspot",
		content_id = "hotspot",
		content = default_button_content
	},
	{
		pass_type = "rect",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			size_addition = {
				-34,
				-12
			},
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				0,
				0,
				0
			}
		}
	},
	{
		value = "content/ui/materials/buttons/background_selected",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			size_addition = {
				-34,
				-12
			},
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				1
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			style.color[1] = 100 + math.max(hotspot.anim_hover_progress, content.hotspot.anim_select_progress) * 155
		end
	},
	{
		value = "content/ui/materials/buttons/secondary",
		pass_type = "texture",
		style = {
			offset = {
				0,
				0,
				2
			}
		}
	},
	{
		style_id = "text",
		pass_type = "text",
		value_id = "text",
		style = default_button_small_text_style,
		change_function = function (content, style)
			local hotspot = content.hotspot
			local default_color = hotspot.disabled and style.disabled_color or style.default_color
			local hover_color = style.hover_color
			local text_color = style.text_color
			local progress = math.max(math.max(hotspot.anim_focus_progress, hotspot.anim_select_progress), math.max(hotspot.anim_hover_progress, hotspot.anim_input_progress))

			color_lerp(default_color, hover_color, progress, text_color)
		end
	},
	size = {
		347,
		50
	}
}
ButtonPassTemplates.default_button_large = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot"
	},
	{
		value = "content/ui/materials/buttons/floating_big_idle",
		style_id = "idle",
		pass_type = "texture",
		style = {
			size = {},
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				0
			}
		}
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/buttons/floating_big_highlight",
		style = {
			hdr = true,
			default_color = Color.ui_terminal(255, true),
			disabled_color = Color.ui_grey_light(255, true),
			input_color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				3
			}
		},
		change_function = function (content, style)
			local color = style.color
			local hotspot = content.hotspot
			local default_color = hotspot.disabled and style.disabled_color or style.default_color
			local input_color = style.input_color
			local hover_progress = hotspot.anim_hover_progress
			local input_progress = hotspot.anim_input_progress
			local select_progress = hotspot.anim_select_progress
			color[1] = 255 * math.max(hover_progress, select_progress)
			local ignore_alpha = true

			color_lerp(default_color, input_color, input_progress, color, ignore_alpha)
		end
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(UIFontSettings.button_primary),
		change_function = function (content, style)
			local default_color = content.hotspot.disabled and style.disabled_color or style.default_color
			local hotspot = content.hotspot
			local hover_progress = hotspot.anim_hover_progress
			local select_progress = hotspot.anim_select_progress
			local progress = math.max(hover_progress, select_progress)

			color_lerp(default_color, style.hover_color, progress, style.text_color)

			style.material = progress == 1 and "content/ui/materials/base/ui_slug_hdr" or nil
		end
	}
}
ButtonPassTemplates.secondary_button_default_height = 64
ButtonPassTemplates.secondary_button = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot"
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/frames/hover",
		style = {
			hdr = true,
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				3
			}
		},
		change_function = function (content, style)
			local color = style.color
			local hotspot = content.hotspot
			color[1] = 255 * math.max(hotspot.anim_hover_progress, hotspot.anim_select_progress)
		end
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(UIFontSettings.button_primary),
		change_function = function (content, style)
			local text_color = style.text_color
			local hotspot = content.hotspot
			local default_color = hotspot.disabled and style.disabled_color or style.default_color
			local highlight_color = style.hover_color
			local hover_progress = math.max(hotspot.anim_hover_progress, hotspot.anim_select_progress)
			local ignore_alpha = true

			color_lerp(default_color, highlight_color, hover_progress, text_color, ignore_alpha)
		end
	}
}
ButtonPassTemplates.list_button_default_height = 64
local list_button_highlight_size_addition = 10
local list_button_icon_size = {
	50,
	50
}
local list_button_hotspot_default_style = {
	anim_hover_speed = 8,
	anim_input_speed = 8,
	anim_select_speed = 8,
	anim_focus_speed = 8,
	on_hover_sound = UISoundEvents.default_mouse_hover,
	on_pressed_sound = UISoundEvents.default_click
}

ButtonPassTemplates.list_button_highlight_change_function = function (content, style)
	local hotspot = content.hotspot
	local progress = math.max(hotspot.anim_hover_progress, hotspot.anim_focus_progress)
	style.color[1] = 255 * math.easeOutCubic(progress)
	local size_addition = list_button_highlight_size_addition * math.easeInCubic(1 - progress)
	local style_size_addition = style.size_addition
	style_size_addition[1] = size_addition * 2
	style_size_addition[2] = size_addition * 2
	local offset = style.offset
	offset[1] = -size_addition
	offset[2] = -size_addition
	style.hdr = progress == 1
end

ButtonPassTemplates.list_button_focused_visibility_function = function (content, style)
	local hotspot = content.hotspot

	return hotspot.is_hover or hotspot.is_selected or hotspot.is_focused
end

ButtonPassTemplates.list_button_label_change_function = function (content, style)
	local hotspot = content.hotspot
	local default_color = hotspot.disabled and style.disabled_color or style.default_color
	local hover_color = style.hover_color
	local color = style.text_color or style.color
	local progress = math.max(hotspot.anim_hover_progress, hotspot.anim_focus_progress)

	color_lerp(default_color, hover_color, progress, color)
end

ButtonPassTemplates.list_button_with_background = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = {
			use_is_focused = true
		},
		style = list_button_hotspot_default_style
	},
	{
		style_id = "background",
		pass_type = "rect",
		style = {
			color = Color.black(100, true),
			offset = {
				0,
				0,
				0
			}
		}
	},
	{
		pass_type = "texture",
		style_id = "background_selected",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				3
			}
		},
		change_function = function (content, style)
			style.color[1] = 255 * content.hotspot.anim_select_progress
		end,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		style_id = "background_glow",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			default_color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				1
			},
			disabled_color = UIFontSettings.list_button.disabled_color,
			hover_color = UIFontSettings.list_button.hover_color
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local progress = math.max(math.max(hotspot.anim_hover_progress, hotspot.anim_select_progress), hotspot.anim_focus_progress)
			style.color[1] = 120 + progress * 135

			ButtonPassTemplates.list_button_label_change_function(content, style)
		end
	},
	{
		pass_type = "texture",
		style_id = "arrow_highlight",
		value = "content/ui/materials/buttons/arrow_01",
		style = {
			horizontal_alignment = "right",
			hdr = true,
			vertical_alignment = "center",
			size = {
				12,
				18
			},
			default_color = Color.ui_terminal(255, true),
			offset = {
				-30,
				0,
				3
			},
			default_offset = {
				-40,
				0,
				3
			},
			size_addition = {
				0,
				0
			},
			disabled_color = UIFontSettings.list_button.disabled_color,
			hover_color = UIFontSettings.list_button.hover_color
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local progress = math.max(hotspot.anim_hover_progress, hotspot.anim_focus_progress)
			local size_addition = 2 * math.easeInCubic(progress)
			local style_size_addition = style.size_addition
			style_size_addition[1] = size_addition * 2
			style_size_addition[2] = size_addition * 2
			local offset = style.offset
			local default_offset = style.default_offset
			offset[1] = default_offset[1] + size_addition * 6
			style.hdr = progress == 1

			ButtonPassTemplates.list_button_label_change_function(content, style)
		end
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/frames/hover",
		style = {
			hdr = true,
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				4
			},
			size_addition = {
				0,
				0
			}
		},
		change_function = ButtonPassTemplates.list_button_highlight_change_function,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(UIFontSettings.list_button),
		change_function = ButtonPassTemplates.list_button_label_change_function
	}
}
local list_button_with_icon_text_style = table.clone(UIFontSettings.list_button)
list_button_with_icon_text_style.offset[1] = 64
local list_button_with_icon_icon_style = {
	vertical_alignment = "center",
	color = list_button_with_icon_text_style.text_color,
	default_color = list_button_with_icon_text_style.default_text_color,
	disabled_color = list_button_with_icon_text_style.disabled_color,
	hover_color = list_button_with_icon_text_style.hover_color,
	size = list_button_icon_size,
	offset = {
		9,
		0,
		3
	}
}
ButtonPassTemplates.list_button_with_background_and_icon = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = {
			use_is_focused = true
		},
		style = list_button_hotspot_default_style
	},
	{
		pass_type = "texture",
		style_id = "background_selected",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				0
			}
		},
		change_function = function (content, style)
			style.color[1] = 255 * content.hotspot.anim_select_progress
		end,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		style_id = "background",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				0
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local progress = math.max(math.max(hotspot.anim_hover_progress, hotspot.anim_select_progress), hotspot.anim_focus_progress)
			style.color[1] = 120 + progress * 135
		end
	},
	{
		pass_type = "texture",
		style_id = "arrow_highlight",
		value = "content/ui/materials/buttons/arrow_01",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			hdr = true,
			size = {
				12,
				18
			},
			color = Color.ui_terminal(255, true),
			offset = {
				-30,
				0,
				3
			},
			default_offset = {
				-40,
				0,
				3
			},
			size_addition = {
				0,
				0
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local progress = math.max(hotspot.anim_hover_progress, hotspot.anim_focus_progress)
			local size_addition = 2 * math.easeInCubic(progress)
			local style_size_addition = style.size_addition
			style_size_addition[1] = size_addition * 2
			style_size_addition[2] = size_addition * 2
			local offset = style.offset
			local default_offset = style.default_offset
			offset[1] = default_offset[1] + size_addition * 6
			style.hdr = progress == 1
		end
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/frames/hover",
		style = {
			hdr = true,
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				3
			},
			size_addition = {
				0,
				0
			}
		},
		change_function = ButtonPassTemplates.list_button_highlight_change_function,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		value_id = "icon",
		style_id = "icon",
		style = table.clone(list_button_with_icon_icon_style),
		change_function = ButtonPassTemplates.list_button_label_change_function
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(UIFontSettings.list_button),
		change_function = ButtonPassTemplates.list_button_label_change_function
	}
}
ButtonPassTemplates.list_button = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = {
			use_is_focused = true
		},
		style = list_button_hotspot_default_style
	},
	{
		pass_type = "texture",
		style_id = "background_selected",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				0
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local hover_progress = content.show_background_with_hover and math_max(hotspot.anim_hover_progress, hotspot.anim_focus_progress) or 0
			style.color[1] = 255 * math_max(content.hotspot.anim_select_progress, hover_progress)
		end,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/frames/hover",
		style = {
			hdr = true,
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				3
			},
			size_addition = {
				0,
				0
			}
		},
		change_function = ButtonPassTemplates.list_button_highlight_change_function,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(UIFontSettings.list_button),
		change_function = ButtonPassTemplates.list_button_label_change_function
	}
}
local list_button_large_text_style = table.clone(UIFontSettings.list_button)
list_button_large_text_style.font_size = 36
list_button_large_text_style.offset = {
	50,
	-2,
	2
}
ButtonPassTemplates.list_button_large_default_height = 128
ButtonPassTemplates.list_button_large = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = {
			use_is_focused = true
		},
		style = list_button_hotspot_default_style
	},
	{
		pass_type = "texture",
		style_id = "background_selected",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				0
			}
		},
		change_function = function (content, style)
			style.color[1] = 255 * content.hotspot.anim_select_progress
		end,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/frames/hover",
		style = {
			hdr = true,
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				3
			},
			size_addition = {
				0,
				0
			}
		},
		change_function = ButtonPassTemplates.list_button_highlight_change_function,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(list_button_large_text_style),
		change_function = ButtonPassTemplates.list_button_label_change_function
	}
}
local list_button_caption_text_style = table.clone(list_button_large_text_style)
list_button_caption_text_style.offset[2] = -15
local list_button_sub_caption_text_style = table.clone(UIFontSettings.list_button)
list_button_sub_caption_text_style.offset[2] = 25
ButtonPassTemplates.list_button_large_with_info = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = {
			use_is_focused = true
		},
		style = list_button_hotspot_default_style
	},
	{
		pass_type = "texture",
		style_id = "background_selected",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				0
			}
		},
		change_function = function (content, style)
			style.color[1] = 255 * content.hotspot.anim_select_progress
		end,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/frames/hover",
		style = {
			hdr = true,
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				3
			},
			size_addition = {
				0,
				0
			}
		},
		change_function = ButtonPassTemplates.list_button_highlight_change_function,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(list_button_caption_text_style),
		change_function = ButtonPassTemplates.list_button_label_change_function
	},
	{
		pass_type = "text",
		style_id = "sub_caption",
		value_id = "sub_caption",
		style = table.clone(list_button_sub_caption_text_style),
		change_function = ButtonPassTemplates.list_button_label_change_function
	}
}
ButtonPassTemplates.list_button_with_icon = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = {
			use_is_focused = true
		},
		style = list_button_hotspot_default_style
	},
	{
		pass_type = "texture",
		style_id = "background_selected",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				0
			}
		},
		change_function = function (content, style)
			style.color[1] = 255 * content.hotspot.anim_select_progress
		end,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/frames/hover",
		style = {
			hdr = true,
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				3
			},
			size_addition = {
				0,
				0
			}
		},
		change_function = ButtonPassTemplates.list_button_highlight_change_function,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		value_id = "icon",
		style_id = "icon",
		style = table.clone(list_button_with_icon_icon_style),
		change_function = ButtonPassTemplates.list_button_label_change_function
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(list_button_with_icon_text_style),
		change_function = ButtonPassTemplates.list_button_label_change_function
	}
}
local list_button_with_two_rows_text_style = table.clone(list_button_with_icon_text_style)
list_button_with_two_rows_text_style.offset[2] = -12
ButtonPassTemplates.list_button_two_rows_with_icon = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = {
			use_is_focused = true
		},
		style = list_button_hotspot_default_style
	},
	{
		pass_type = "texture",
		style_id = "background_selected",
		value = "content/ui/materials/buttons/background_selected",
		style = {
			color = Color.ui_terminal(0, true),
			offset = {
				0,
				0,
				0
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local hover_progress = content.show_background_with_hover and hotspot.anim_hover_progress or 0
			style.color[1] = 255 * math_max(content.hotspot.anim_select_progress, hover_progress)
		end,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		style_id = "highlight",
		value = "content/ui/materials/frames/hover",
		style = {
			hdr = true,
			color = Color.ui_terminal(255, true),
			offset = {
				0,
				0,
				3
			},
			size_addition = {
				0,
				0
			}
		},
		change_function = ButtonPassTemplates.list_button_highlight_change_function,
		visibility_function = ButtonPassTemplates.list_button_focused_visibility_function
	},
	{
		pass_type = "texture",
		value_id = "icon",
		style_id = "icon",
		style = table.clone(list_button_with_icon_icon_style),
		change_function = ButtonPassTemplates.list_button_label_change_function
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = table.clone(list_button_with_two_rows_text_style),
		change_function = ButtonPassTemplates.list_button_label_change_function
	},
	{
		pass_type = "text",
		style_id = "second_row",
		value_id = "second_row",
		style = table.clone(UIFontSettings.list_button_second_row),
		change_function = ButtonPassTemplates.list_button_label_change_function
	}
}
local continue_button_text_style = table.clone(UIFontSettings.header_3)
continue_button_text_style.offset = {
	-25,
	0,
	2
}
continue_button_text_style.text_horizontal_alignment = "right"
continue_button_text_style.text_vertical_alignment = "center"
continue_button_text_style.hover_color = Color.ui_grey_light(255, true)
continue_button_text_style.default_text_color = {
	255,
	255,
	255,
	255
}
continue_button_text_style.text_color = {
	255,
	255,
	255,
	255
}
ButtonPassTemplates.continue_button = {
	{
		pass_type = "hotspot",
		content_id = "hotspot",
		content = default_button_content
	},
	{
		value = "content/ui/materials/buttons/arrow_01",
		style_id = "arrow",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			size = {
				11.5,
				17
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				2
			}
		}
	},
	{
		value = "content/ui/materials/buttons/arrow_01",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			size = {
				11.5,
				17
			},
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				1,
				1,
				1
			}
		}
	},
	{
		pass_type = "text",
		value_id = "text",
		style = continue_button_text_style,
		change_function = function (content, style)
			local default_text_color = style.default_text_color
			local hover_color = style.hover_color
			local text_color = style.text_color
			local hotspot = content.hotspot
			local progress = math.max(hotspot.anim_hover_progress, hotspot.anim_input_progress)
			local arrow_style = style.parent.arrow
			local arrow_color = arrow_style.color

			for i = 2, 4 do
				text_color[i] = (hover_color[i] - default_text_color[i]) * progress + default_text_color[i]
				arrow_color[i] = text_color[i]
			end
		end
	}
}
local menu_panel_button_style = table.clone(UIFontSettings.header_3)
menu_panel_button_style.text_horizontal_alignment = "center"
menu_panel_button_style.text_vertical_alignment = "center"
menu_panel_button_style.offset = {
	0,
	0,
	3
}
local menu_panel_button_hotspot_content = {
	on_hover_sound = UISoundEvents.tab_button_hovered,
	on_pressed_sound = UISoundEvents.tab_button_pressed
}
ButtonPassTemplates.menu_panel_button = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = menu_panel_button_hotspot_content,
		style = {
			anim_select_speed = 4
		}
	},
	{
		value_id = "divider_bottom",
		style_id = "divider_bottom",
		pass_type = "texture",
		value = "content/ui/materials/dividers/skull_rendered_center_03",
		style = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			size = {
				nil,
				26
			},
			offset = {
				0,
				20,
				2
			}
		},
		visibility_function = function (content, style)
			return content.hotspot.is_selected
		end
	},
	{
		style_id = "glow",
		pass_type = "texture",
		value = "content/ui/materials/effects/wide_upward_glow",
		value_id = "glow",
		style = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			color = Color.ui_terminal(255, true),
			size = {
				nil,
				0
			},
			size_addition = {
				-5,
				0
			},
			offset = {
				0,
				-3,
				1
			}
		},
		change_function = function (content, style)
			style.color[1] = 255 * math.easeOutCubic(content.hotspot.anim_select_progress)
			style.size_addition[2] = 80 * content.hotspot.anim_select_progress
		end,
		visibility_function = function (content, style)
			return content.hotspot.is_selected
		end
	},
	{
		pass_type = "text",
		style_id = "text",
		value_id = "text",
		style = menu_panel_button_style,
		change_function = function (content, style)
			local hotspot = content.hotspot
			local default_text_color = hotspot.disabled and style.disabled_color or style.default_color
			local hover_color = style.hover_color
			local text_color = style.text_color
			local progress = math.max(hotspot.anim_focus_progress, hotspot.anim_select_progress, hotspot.anim_hover_progress, hotspot.anim_input_progress)

			color_lerp(default_text_color, hover_color, progress, text_color)
		end
	},
	{
		style_id = "alert_dot",
		pass_type = "texture",
		value = "content/ui/materials/icons/system/page_indicator_idle",
		style = {
			vertical_alignment = "center",
			hdr = true,
			horizontal_alignment = "right",
			size = {
				30,
				30
			},
			offset = {
				12,
				-10,
				0
			},
			color = Color.ui_hud_red_light(255, true)
		},
		visibility_function = function (content)
			return content.show_alert
		end
	},
	{
		pass_type = "texture",
		style_id = "alert_ring",
		value = "content/ui/materials/icons/system/page_indicator_active",
		style = {
			anim_time = 1,
			horizontal_alignment = "right",
			hdr = true,
			vertical_alignment = "center",
			pause_time = 1,
			size = {
				30,
				30
			},
			offset = {
				12,
				-10,
				0
			},
			color = Color.ui_hud_red_light(255, true),
			size_addition = {
				0,
				0
			}
		},
		change_function = function (content, style, animation, dt)
			local anim_time = style.anim_time
			local pause_time = style.pause_time or 0
			local total_time = anim_time + pause_time
			local progress_time = content.alert_anim_time or 0
			progress_time = math.fmod(progress_time + dt, total_time)
			content.alert_anim_time = progress_time
			local progress = progress_time <= anim_time and anim_time and progress_time / anim_time or 1
			local size_addition = math.sirp(-style.size[1], 0, progress)
			local style_size_additon = style.size_addition
			style_size_additon[1] = size_addition
			style_size_additon[2] = size_addition
			local default_offset = style.default_offset

			if not default_offset then
				default_offset = {
					style.offset[1],
					style.offset[2]
				}
				style.default_offset = default_offset
			end

			local extra_offset = size_addition / 2
			local style_offset = style.offset
			style_offset[1] = default_offset[1] + extra_offset
			style.color[1] = 255 * (1 - progress)
		end,
		visibility_function = function (content)
			return content.show_alert
		end
	}
}
local tab_menu_button_hotspot_content = {
	on_hover_sound = UISoundEvents.tab_secondary_button_hovered,
	on_pressed_sound = UISoundEvents.tab_secondary_button_pressed
}
ButtonPassTemplates.tab_menu_button = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = tab_menu_button_hotspot_content
	},
	{
		style_id = "glow",
		pass_type = "texture",
		value = "content/ui/materials/effects/wide_upward_glow",
		value_id = "glow",
		style = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			color = Color.ui_terminal(255, true),
			size = {
				nil,
				0
			},
			size_addition = {
				0,
				0
			},
			offset = {
				0,
				-3,
				2
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local progress = math_max(hotspot.anim_focus_progress, hotspot.anim_select_progress)
			style.color[1] = 255 * math.easeOutCubic(progress)
			style.size_addition[2] = 80 * progress
		end,
		visibility_function = function (content, style)
			local hotspot = content.hotspot

			return hotspot.anim_focus_progress > 0 or hotspot.anim_select_progress > 0
		end
	},
	{
		style_id = "text",
		pass_type = "text",
		value_id = "text",
		style = table.clone(UIFontSettings.tab_menu_button),
		visibility_function = function (content, style)
			local hotspot = content.hotspot

			return hotspot.anim_hover_progress < 1 and hotspot.anim_focus_progress < 1 and hotspot.anim_select_progress < 1 and hotspot.anim_input_progress < 1
		end
	},
	{
		style_id = "text_hover",
		pass_type = "text",
		value_id = "text",
		style = table.clone(UIFontSettings.tab_menu_button_hover),
		change_function = function (content, style)
			local hotspot = content.hotspot
			local text_color = style.text_color
			local math_max = math_max
			local progress = math_max(math_max(hotspot.anim_focus_progress, hotspot.anim_select_progress), math_max(hotspot.anim_hover_progress, hotspot.anim_input_progress))
			text_color[1] = 255 * math.easeInCubic(progress)
		end,
		visibility_function = function (content, style)
			local hotspot = content.hotspot

			return hotspot.anim_hover_progress > 0 or hotspot.anim_focus_progress > 0 or hotspot.anim_select_progress > 0 or hotspot.anim_input_progress > 0
		end
	}
}
ButtonPassTemplates.tab_menu_button_icon = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = tab_menu_button_hotspot_content
	},
	{
		style_id = "glow",
		pass_type = "texture",
		value = "content/ui/materials/effects/wide_upward_glow",
		value_id = "glow",
		style = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			color = Color.ui_terminal(255, true),
			size = {
				nil,
				0
			},
			size_addition = {
				0,
				0
			},
			offset = {
				0,
				8,
				2
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local progress = math_max(hotspot.anim_focus_progress, hotspot.anim_select_progress)
			style.color[1] = 255 * math.easeOutCubic(progress)
			style.size_addition[2] = 80 * progress
		end,
		visibility_function = function (content, style)
			local hotspot = content.hotspot

			return hotspot.anim_focus_progress > 0 or hotspot.anim_select_progress > 0
		end
	},
	{
		style_id = "icon",
		pass_type = "texture",
		value_id = "icon",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			default_color = Color.ui_brown_light(255, true),
			hover_color = Color.ui_brown_super_light(255, true),
			disabled_color = Color.ui_grey_medium(255, true),
			color = {
				255,
				255,
				255,
				255
			},
			size = {
				50,
				50
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local default_color = hotspot.disabled and style.disabled_color or style.default_color
			local hover_color = style.hover_color
			local color = style.color
			local math_max = math_max
			local progress = math_max(math_max(hotspot.anim_focus_progress, hotspot.anim_select_progress), math_max(hotspot.anim_hover_progress, hotspot.anim_input_progress))

			color_lerp(default_color, hover_color, progress, color)
		end
	}
}
ButtonPassTemplates.page_indicator = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = tab_menu_button_hotspot_content
	},
	{
		value_id = "icon",
		pass_type = "texture",
		style_id = "icon",
		value = "content/ui/materials/icons/system/page_indicator_active",
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			default_color = Color.ui_grey_medium(255, true),
			hover_color = Color.ui_brown_super_light(255, true),
			disabled_color = Color.ui_grey_medium(255, true),
			color = {
				255,
				255,
				255,
				255
			},
			size = {
				20,
				20
			}
		},
		change_function = function (content, style)
			local hotspot = content.hotspot
			local default_color = hotspot.disabled and style.disabled_color or style.default_color
			local hover_color = style.hover_color
			local color = style.color
			local progress = math.max(math.max(hotspot.anim_focus_progress, hotspot.anim_select_progress), math.max(hotspot.anim_hover_progress, hotspot.anim_input_progress))

			color_lerp(default_color, hover_color, progress, color)
		end
	}
}
local input_legend_button_style = table.clone(UIFontSettings.button_2)
input_legend_button_style.text_horizontal_alignment = "center"
input_legend_button_style.text_vertical_alignment = "center"
input_legend_button_style.text_color = {
	255,
	102,
	102,
	102
}
input_legend_button_style.default_text_color = {
	255,
	102,
	102,
	102
}
input_legend_button_style.hover_color = {
	255,
	255,
	255,
	255
}
ButtonPassTemplates.input_legend_button = {
	{
		style_id = "text",
		pass_type = "text",
		value_id = "text",
		style = input_legend_button_style,
		change_function = function (content, style)
			local hotspot = content.hotspot
			local default_text_color = style.default_text_color
			local hover_color = style.hover_color
			local text_color = style.text_color
			local progress = math.max(hotspot.anim_hover_progress or 0, hotspot.anim_input_progress or 0)

			for i = 2, 4 do
				text_color[i] = (hover_color[i] - default_text_color[i]) * progress + default_text_color[i]
			end
		end
	},
	{
		pass_type = "hotspot",
		content_id = "hotspot",
		content = default_button_content
	}
}
ButtonPassTemplates.title_back_button = {
	{
		style_id = "hotspot",
		pass_type = "hotspot",
		content_id = "hotspot",
		content = default_button_content
	},
	{
		value = "content/ui/materials/icons/system/return",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			hdr = false,
			horizontal_alignment = "center",
			size_addition = {
				-32,
				-32
			},
			offset = {
				0,
				0,
				1
			},
			color = Color.ui_brown_light(255, true)
		}
	},
	{
		value = "content/ui/materials/buttons/rhombus",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			hdr = false,
			horizontal_alignment = "center",
			offset = {
				0,
				0,
				0
			},
			color = Color.ui_brown_medium(255, true)
		}
	},
	{
		value = "content/ui/materials/buttons/rhombus_highlight",
		pass_type = "texture",
		style = {
			vertical_alignment = "center",
			hdr = true,
			horizontal_alignment = "center",
			offset = {
				0,
				0,
				2
			},
			color = Color.ui_highlight_color(255, true)
		},
		change_function = function (content, style)
			style.color[1] = content.hotspot.anim_hover_progress * 255
		end
	}
}

ButtonPassTemplates.settings_button = function (width, height, settings_area_width, use_is_focused)
	local header_width = width - settings_area_width
	local font_style = table.clone(UIFontSettings.button_primary)
	font_style.offset = {
		header_width,
		0,
		3
	}
	font_style.size = {
		settings_area_width,
		height
	}
	local passes = ListHeaderPassTemplates.list_header(header_width, height, use_is_focused)
	local button_passes = {
		{
			pass_type = "texture",
			style_id = "highlight",
			value = "content/ui/materials/frames/hover",
			style = {
				hdr = true,
				color = Color.ui_terminal(255, true),
				offset = {
					header_width,
					0,
					3
				},
				size = {
					settings_area_width,
					height
				}
			},
			change_function = function (content, style)
				local color = style.color
				local hotspot = content.hotspot
				color[1] = 255 * math.max(hotspot.anim_hover_progress, hotspot.anim_select_progress)
			end
		},
		{
			value = "content/ui/materials/buttons/background_selected",
			pass_type = "texture",
			style = {
				offset = {
					header_width,
					0,
					3
				},
				size = {
					settings_area_width,
					height
				},
				color = Color.ui_terminal(255, true)
			}
		},
		{
			pass_type = "text",
			style_id = "text",
			value_id = "button_text",
			style = font_style,
			change_function = function (content, style)
				local text_color = style.text_color
				local hotspot = content.hotspot
				local default_color = hotspot.disabled and style.disabled_color or style.default_color
				local highlight_color = style.hover_color
				local hover_progress = math.max(hotspot.anim_hover_progress, hotspot.anim_select_progress)
				local ignore_alpha = true

				color_lerp(default_color, highlight_color, hover_progress, text_color, ignore_alpha)
			end
		}
	}

	table.append(passes, button_passes)

	return passes
end

return settings("ButtonPassTemplates", ButtonPassTemplates)