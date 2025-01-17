local UIWorkspaceSettings = require("scripts/settings/ui/ui_workspace_settings")
local UIWidget = require("scripts/managers/ui/ui_widget")
local ElementSettings = require("scripts/ui/hud/elements/tactical_overlay/hud_element_tactical_overlay_settings")
local WalletSettings = require("scripts/settings/wallet_settings")
local element_styles = ElementSettings.styles
local details_panel_size = {
	600,
	1080
}
local mission_info_size = {
	details_panel_size[1] - 50,
	160
}
local circumstance_info_size = {
	details_panel_size[1] - 50,
	120
}
local plasteel_info_size = {
	details_panel_size[1] - 50,
	40
}
local diamantine_info_size = {
	details_panel_size[1] - 50,
	40
}
local screen_size = UIWorkspaceSettings.screen.size
local scenegraph_definition = {
	screen = UIWorkspaceSettings.screen,
	background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = screen_size,
		position = {
			0,
			0,
			100
		}
	},
	left_panel = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "left",
		size = details_panel_size,
		position = {
			25,
			0,
			0
		}
	},
	mission_info_panel = {
		vertical_alignment = "top",
		parent = "left_panel",
		horizontal_alignment = "left",
		size = mission_info_size,
		position = {
			0,
			0,
			1
		}
	},
	circumstance_info_panel = {
		vertical_alignment = "top",
		parent = "left_panel",
		horizontal_alignment = "left",
		size = circumstance_info_size,
		position = {
			0,
			0,
			1
		}
	},
	crafting_pickup_pivot = {
		vertical_alignment = "top",
		parent = "left_panel",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	plasteel_info_panel = {
		vertical_alignment = "top",
		parent = "crafting_pickup_pivot",
		horizontal_alignment = "left",
		size = plasteel_info_size,
		position = {
			0,
			0,
			1
		}
	},
	diamantine_info_panel = {
		vertical_alignment = "top",
		parent = "crafting_pickup_pivot",
		horizontal_alignment = "left",
		size = diamantine_info_size,
		position = {
			0,
			0,
			1
		}
	}
}
local widget_definitions = {
	background = UIWidget.create_definition({
		{
			value = "content/ui/materials/backgrounds/hud/tactical_overlay_background",
			pass_type = "texture",
			style = {
				color = {
					255,
					0,
					0,
					0
				}
			}
		}
	}, "background")
}
local left_panel_widgets_definitions = {
	danger_info = UIWidget.create_definition({
		{
			value = "content/ui/materials/icons/generic/danger",
			pass_type = "texture",
			style = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					169,
					191,
					153
				},
				offset = {
					5,
					5,
					2
				},
				size = {
					50,
					50
				}
			}
		},
		{
			value = "content/ui/materials/backgrounds/default_square",
			style_id = "diffulty_icon_background",
			pass_type = "multi_texture"
		},
		{
			value = "content/ui/materials/frames/frame_tile_2px",
			style_id = "diffulty_icon_background_frame",
			pass_type = "multi_texture"
		},
		{
			value = "content/ui/materials/backgrounds/default_square",
			style_id = "difficulty_icon",
			pass_type = "multi_texture"
		}
	}, "mission_info_panel", nil, nil, element_styles.difficulty),
	mission_info = UIWidget.create_definition({
		{
			value = "content/ui/materials/icons/generic/danger",
			value_id = "icon",
			pass_type = "texture",
			style = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = Color.terminal_text_header(255, true),
				offset = {
					0,
					25,
					2
				},
				size = {
					60,
					60
				}
			}
		},
		{
			style_id = "mission_name",
			value_id = "mission_name",
			pass_type = "text",
			style = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				text_vertical_alignment = "top",
				font_size = 34,
				text_horizontal_alignment = "left",
				offset = {
					65,
					15,
					10
				},
				size = {
					mission_info_size[1] + 100,
					50
				},
				text_color = {
					255,
					169,
					191,
					153
				}
			}
		},
		{
			style_id = "mission_type",
			value_id = "mission_type",
			pass_type = "text",
			style = {
				vertical_alignment = "bottom",
				text_vertical_alignment = "top",
				horizontal_alignment = "center",
				text_horizontal_alignment = "left",
				offset = {
					65,
					0,
					10
				},
				size = {
					mission_info_size[1],
					50
				},
				text_color = {
					255,
					169,
					191,
					153
				}
			}
		}
	}, "mission_info_panel"),
	circumstance_info = UIWidget.create_definition({
		{
			value = "content/ui/materials/hud/backgrounds/fade_horizontal",
			pass_type = "texture_uv",
			style = {
				color = Color.terminal_background(160, true),
				offset = {
					0,
					0,
					-3
				},
				uvs = {
					{
						0,
						1
					},
					{
						1,
						0
					}
				}
			}
		},
		{
			value = "content/ui/materials/backgrounds/default_square",
			pass_type = "rect",
			style = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				size = {
					3
				},
				color = Color.golden_rod(255, true)
			}
		},
		{
			pass_type = "text",
			value = Utf8.upper(Localize("loc_glossary_term_circumstance_hazard")),
			style = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				offset = {
					0,
					-40,
					10
				},
				size = {
					nil,
					30
				},
				text_color = {
					255,
					169,
					191,
					153
				}
			}
		},
		{
			value_id = "icon",
			style_id = "icon",
			pass_type = "texture",
			value = "content/ui/materials/icons/generic/danger",
			style = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = Color.golden_rod(255, true),
				offset = {
					25,
					20,
					2
				},
				size = {
					40,
					40
				}
			}
		},
		{
			style_id = "circumstance_name",
			value_id = "circumstance_name",
			pass_type = "text",
			style = {
				vertical_alignment = "top",
				text_vertical_alignment = "center",
				horizontal_alignment = "left",
				text_horizontal_alignment = "left",
				offset = {
					75,
					20,
					10
				},
				size = {
					circumstance_info_size[1] - 75,
					40
				},
				text_color = Color.golden_rod(255, true)
			}
		},
		{
			style_id = "circumstance_description",
			value_id = "circumstance_description",
			pass_type = "text",
			style = {
				vertical_alignment = "top",
				text_vertical_alignment = "top",
				horizontal_alignment = "left",
				text_horizontal_alignment = "left",
				offset = {
					25,
					60,
					10
				},
				size = {
					circumstance_info_size[1] - 25,
					60
				},
				text_color = {
					255,
					169,
					191,
					153
				}
			}
		}
	}, "circumstance_info_panel"),
	plasteel_info = UIWidget.create_definition({
		{
			pass_type = "text",
			value = Localize(WalletSettings.plasteel.display_name),
			style = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				offset = {
					0,
					0,
					10
				},
				size = {
					nil,
					30
				},
				text_color = {
					255,
					169,
					191,
					153
				}
			}
		},
		{
			value_id = "plasteel_amount_id",
			pass_type = "text",
			style = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				offset = {
					200,
					0,
					10
				},
				size = {
					400,
					30
				},
				text_color = Color.golden_rod(255, true)
			}
		}
	}, "plasteel_info_panel"),
	diamantine_info = UIWidget.create_definition({
		{
			pass_type = "text",
			value = Localize(WalletSettings.diamantine.display_name),
			style = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				offset = {
					0,
					0,
					10
				},
				size = {
					nil,
					30
				},
				text_color = {
					255,
					169,
					191,
					153
				}
			}
		},
		{
			value_id = "diamantine_amount_id",
			pass_type = "text",
			style = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				offset = {
					200,
					0,
					10
				},
				size = {
					400,
					30
				},
				text_color = Color.golden_rod(255, true)
			}
		}
	}, "diamantine_info_panel")
}

local function for_all_left_widgets(parent, func)
	local left_panel_widgets = parent._left_panel_widgets

	for _, widget in ipairs(left_panel_widgets) do
		func(widget)
	end
end

local animations = {
	enter = {
		{
			name = "reset",
			end_time = 0,
			start_time = 0,
			init = function (parent, ui_scenegraph, scenegraph_definition, widgets, params)
				local start_pos = 25 - details_panel_size[1]

				parent:set_scenegraph_position("left_panel", start_pos)
				for_all_left_widgets(parent, function (widget)
					widget.alpha_multiplier = 0
				end)
			end
		},
		{
			name = "left_panel_enter",
			end_time = 0.5,
			start_time = 0,
			update = function (parent, ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local new_pos = 25 - details_panel_size[1] + details_panel_size[1] * math.easeOutCubic(progress)

				parent:set_scenegraph_position("left_panel", new_pos)
				for_all_left_widgets(parent, function (widget)
					widget.alpha_multiplier = progress
				end)

				return true
			end
		}
	},
	exit = {
		{
			name = "left_panel_exit",
			end_time = 0.5,
			start_time = 0,
			update = function (parent, ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local new_pos = 25 - details_panel_size[1] * math.easeOutCubic(progress)

				parent:set_scenegraph_position("left_panel", new_pos)
				for_all_left_widgets(parent, function (widget)
					widget.alpha_multiplier = 1 - progress
				end)

				return true
			end
		}
	}
}

return {
	animations = animations,
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	left_panel_widgets_definitions = left_panel_widgets_definitions
}
