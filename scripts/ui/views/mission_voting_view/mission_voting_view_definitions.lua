local UIWidget = require("scripts/managers/ui/ui_widget")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local UIWorkspaceSettings = require("scripts/settings/ui/ui_workspace_settings")
local ButtonPassTemplates = require("scripts/ui/pass_templates/button_pass_templates")
local ScrollbarPassTemplates = require("scripts/ui/pass_templates/scrollbar_pass_templates")
local ViewStyles = require("scripts/ui/views/mission_voting_view/mission_voting_view_styles")
local outer_panel_size = {
	688,
	796
}
local inner_panel_size = {
	600,
	560
}
local player_portrait_size = {
	70,
	80
}
local title_bar_size = {
	outer_panel_size[1],
	154
}
local zone_image_size = {
	inner_panel_size[1],
	120
}
local header_size = {
	inner_panel_size[1],
	zone_image_size[2] + 54
}
local body_size = {
	inner_panel_size[1],
	260
}
local footer_size = {
	688,
	262
}
local mission_info_panel_size = {
	body_size[1] - 40,
	250
}
local mission_info_size = {
	mission_info_panel_size[1],
	152
}
local mission_salary_size = {
	mission_info_size[1],
	40
}
local mission_difficulty_panel_size = {
	mission_info_size[1] / 2,
	71
}
local mission_difficulty_size = {
	168,
	mission_difficulty_panel_size[2]
}
local mission_difficulty_divider_size = {
	1,
	mission_difficulty_panel_size[2] - 4
}
local mission_circumstance_size = {
	mission_info_size[1],
	71
}
local details_panel_size = {
	inner_panel_size[1],
	500
}
local details_panel_content_size = {
	details_panel_size[1] - 60,
	details_panel_size[2]
}
local scrollbar_size = {
	10,
	details_panel_size[2] - 40
}
local accept_button_size = {
	440,
	78
}
local timer_bar_size = {
	310,
	10
}
local secondary_button_size = {
	398,
	64
}
outer_panel_size = {
	688,
	850
}
inner_panel_size = {
	600,
	600
}
zone_image_size = {
	inner_panel_size[1],
	240
}
header_size = {
	inner_panel_size[1],
	zone_image_size[2] - 120 + 54
}
local mission_type_size = {
	560,
	40
}
mission_difficulty_size = {
	200,
	mission_difficulty_panel_size[2] + 25
}
mission_difficulty_divider_size = {
	1,
	mission_difficulty_panel_size[2] + 25 - 4
}
local misson_rewards_size = {
	240,
	mission_difficulty_panel_size[2] + 25
}
local circumstance_icon_size = {
	50,
	50
}
local zone_image_bottom_fade_size = {
	zone_image_size[1],
	120
}
local mission_reward_size = {
	200,
	40
}
local outer_panel_y_offset = -(UIWorkspaceSettings.screen.size[2] * 0.075)
local outer_panel_position = {
	0,
	outer_panel_y_offset,
	0
}
local inner_panel_position = {
	44,
	50,
	1
}
local header_position = {
	0,
	0,
	6
}
local title_bar_position = {
	0,
	0,
	20
}
local zone_image_position = {
	0,
	54,
	6
}
local body_position = {
	0,
	header_size[2],
	3
}
local mission_info_panel_position = {
	0,
	0,
	3
}
local mission_info_position = {
	0,
	0,
	4
}
local mission_salary_position = {
	0,
	20,
	1
}
local mission_difficulty_position = {
	0,
	0,
	4
}
local mission_difficulty_challenge_position = {
	0,
	35,
	1
}
local mission_circumstance_position = {
	0,
	0,
	0
}
local footer_position = {
	0,
	0,
	25
}
local accept_button_position = {
	0,
	16,
	1
}
local decline_button_position = {
	0,
	75,
	0
}
local details_button_position = {
	0,
	64,
	10
}
local player_portrait_position = {
	18,
	26,
	15
}
local mission_difficulty_extra_offset = {
	0,
	20,
	0
}
local details_panel_position = {
	0,
	0,
	4
}
local details_content_position = {
	40,
	0,
	5
}
local scrollbar_position = {
	0,
	20,
	5
}
local timer_bar_position = {
	0,
	15,
	0
}
mission_info_panel_position = {
	0,
	50,
	3
}
local mission_type_position = {
	0,
	50,
	4
}
local mission_summary_position = {
	0,
	55,
	4
}
mission_difficulty_challenge_position = {
	0,
	15,
	1
}
details_button_position = {
	0,
	-accept_button_size[2] - 15,
	10
}
local circumstance_icon_position = {
	-10,
	10,
	5
}
local zone_image_bottom_fade_position = {
	0,
	0,
	5
}
local reward_main_mission_position = {
	0,
	10,
	0
}
local reward_salary_position = {
	-30,
	0,
	0
}
local reward_side_mission_position = {
	0,
	40,
	0
}
local reward_flash_mission_position = {
	90,
	0,
	0
}
local details_widget_spacing = {
	details_panel_size[1],
	25
}
local details_panel_end_padding = {
	details_panel_size[1],
	10
}
local scenegraph_definition = {
	screen = UIWorkspaceSettings.screen,
	outer_panel = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = outer_panel_size,
		position = outer_panel_position
	},
	inner_panel = {
		vertical_alignment = "top",
		parent = "outer_panel",
		horizontal_alignment = "left",
		size = inner_panel_size,
		position = inner_panel_position
	},
	panel_header = {
		vertical_alignment = "top",
		parent = "inner_panel",
		horizontal_alignment = "left",
		size = header_size,
		position = header_position
	},
	player_portrait_center = {
		vertical_alignment = "top",
		parent = "panel_header",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = player_portrait_position
	},
	title_bar = {
		vertical_alignment = "top",
		parent = "outer_panel",
		horizontal_alignment = "left",
		size = title_bar_size,
		position = title_bar_position
	},
	zone_image = {
		vertical_alignment = "top",
		parent = "inner_panel",
		horizontal_alignment = "left",
		size = zone_image_size,
		position = zone_image_position
	},
	mission_icons_pivot = {
		vertical_alignment = "top",
		parent = "zone_image",
		horizontal_alignment = "left",
		size = {
			49.6,
			49.6
		},
		position = {
			10,
			10,
			0
		}
	},
	body_panel = {
		vertical_alignment = "top",
		parent = "inner_panel",
		horizontal_alignment = "left",
		size = body_size,
		position = body_position
	},
	mission_info_panel = {
		vertical_alignment = "center",
		parent = "body_panel",
		horizontal_alignment = "center",
		size = mission_info_panel_size,
		position = mission_info_panel_position
	},
	mission_info = {
		vertical_alignment = "top",
		parent = "mission_info_panel",
		horizontal_alignment = "left",
		size = mission_info_size,
		position = mission_info_position
	},
	mission_type = {
		vertical_alignment = "top",
		parent = "mission_info_panel",
		horizontal_alignment = "center",
		size = mission_type_size,
		position = {
			0,
			20,
			10
		}
	},
	mission_salary = {
		vertical_alignment = "top",
		parent = "mission_info",
		horizontal_alignment = "center",
		size = mission_salary_size,
		position = mission_salary_position
	},
	mission_difficulty_left = {
		vertical_alignment = "bottom",
		parent = "mission_info",
		horizontal_alignment = "left",
		size = mission_difficulty_panel_size,
		position = mission_difficulty_position
	},
	mission_difficulty_right = {
		vertical_alignment = "bottom",
		parent = "mission_info",
		horizontal_alignment = "right",
		size = mission_difficulty_panel_size,
		position = mission_difficulty_position
	},
	mission_difficulty_resistance = {
		vertical_alignment = "bottom",
		parent = "mission_difficulty_left",
		horizontal_alignment = "center",
		size = mission_difficulty_size,
		position = mission_summary_position
	},
	zone_image_bottom_fade = {
		vertical_alignment = "bottom",
		parent = "zone_image",
		horizontal_alignment = "center",
		size = zone_image_bottom_fade_size,
		position = zone_image_bottom_fade_position
	},
	circumstance_icon = {
		vertical_alignment = "top",
		parent = "zone_image",
		horizontal_alignment = "right",
		size = circumstance_icon_size,
		position = circumstance_icon_position
	},
	mission_rewards_challenge = {
		vertical_alignment = "bottom",
		parent = "mission_difficulty_right",
		horizontal_alignment = "center",
		size = misson_rewards_size,
		position = mission_summary_position
	},
	reward_main_mission = {
		vertical_alignment = "center",
		parent = "mission_rewards_challenge",
		horizontal_alignment = "center",
		size = mission_reward_size,
		position = reward_main_mission_position
	},
	reward_side_mission = {
		vertical_alignment = "center",
		parent = "mission_rewards_challenge",
		horizontal_alignment = "center",
		size = mission_reward_size,
		position = reward_side_mission_position
	},
	mission_difficulty_divider = {
		vertical_alignment = "bottom",
		parent = "mission_info",
		horizontal_alignment = "center",
		size = mission_difficulty_divider_size,
		position = mission_summary_position
	},
	mission_circumstance = {
		vertical_alignment = "bottom",
		parent = "mission_info_panel",
		horizontal_alignment = "center",
		size = mission_circumstance_size,
		position = mission_circumstance_position
	},
	details_panel = {
		vertical_alignment = "top",
		parent = "body_panel",
		horizontal_alignment = "left",
		size = details_panel_size,
		position = details_panel_position
	},
	details_panel_content = {
		vertical_alignment = "top",
		parent = "details_panel",
		horizontal_alignment = "left",
		size = details_panel_content_size,
		position = details_content_position
	},
	footer_panel = {
		vertical_alignment = "bottom",
		parent = "outer_panel",
		horizontal_alignment = "center",
		size = footer_size,
		position = footer_position
	},
	accept_button = {
		vertical_alignment = "top",
		parent = "footer_panel",
		horizontal_alignment = "center",
		size = accept_button_size,
		position = accept_button_position
	},
	timer_bar = {
		vertical_alignment = "bottom",
		parent = "accept_button",
		horizontal_alignment = "center",
		size = timer_bar_size,
		position = timer_bar_position
	},
	decline_button = {
		vertical_alignment = "bottom",
		parent = "outer_panel",
		horizontal_alignment = "center",
		size = secondary_button_size,
		position = decline_button_position
	},
	toggle_details_button = {
		vertical_alignment = "bottom",
		parent = "accept_button",
		horizontal_alignment = "center",
		size = secondary_button_size,
		position = details_button_position
	},
	details_scrollbar = {
		vertical_alignment = "top",
		parent = "details_panel",
		horizontal_alignment = "right",
		size = scrollbar_size,
		position = scrollbar_position
	},
	details_mask = {
		vertical_alignment = "center",
		parent = "details_panel",
		horizontal_alignment = "center",
		size = details_panel_size,
		position = {
			0,
			0,
			0
		}
	},
	details_interaction = {
		vertical_alignment = "top",
		parent = "details_panel",
		horizontal_alignment = "left",
		size = details_panel_size,
		position = {
			0,
			0,
			0
		}
	}
}
local mission_type_font_style = ViewStyles.mission_type_font_style
mission_type_font_style.size = {
	mission_info_size[1] - mission_type_font_style.offset[1],
	mission_info_size[2]
}
mission_type_font_style.text_vertical_alignment = "top"
local decline_button_passes = table.clone(ButtonPassTemplates.secondary_button)
decline_button_passes[#decline_button_passes + 1] = {
	value = "content/ui/materials/frames/hover",
	style_id = "frame",
	pass_type = "texture"
}
local widget_definitions = {
	inner_panel_background = UIWidget.create_definition({
		{
			pass_type = "rect",
			style = {
				color = Color.black(255, true)
			}
		},
		{
			value = "content/ui/materials/frames/line_thin_rendered",
			pass_type = "texture",
			style = ViewStyles.inner_panel_frame_style
		},
		{
			value = "content/ui/materials/frames/dropshadow_medium",
			pass_type = "texture",
			style = ViewStyles.inner_panel_drop_shadow_style
		}
	}, "inner_panel"),
	title_bar = UIWidget.create_definition({
		{
			value = "content/ui/materials/frames/mission_vote_top",
			pass_type = "texture",
			style = ViewStyles.title_bar_background_style
		},
		{
			pass_type = "text",
			value = Managers.localization:localize("loc_mission_voting_view_title"),
			style = ViewStyles.title_font_style
		}
	}, "title_bar"),
	zone_image = UIWidget.create_definition({
		{
			pass_type = "texture",
			value_id = "texture"
		}
	}, "zone_image"),
	zone_image_bottom_fade = UIWidget.create_definition({
		{
			value = "content/ui/materials/backgrounds/bottom_fade",
			value_id = "bottom_fade",
			pass_type = "texture",
			style_id = "bottom_fade"
		}
	}, "zone_image_bottom_fade"),
	footer = UIWidget.create_definition({
		{
			pass_type = "texture",
			value = "content/ui/materials/frames/mission_vote_bottom"
		}
	}, "footer_panel"),
	timer_bar = UIWidget.create_definition({
		{
			value = "content/ui/materials/bars/plain_thin_fill",
			pass_type = "texture",
			style = ViewStyles.timer_bar_background_style
		},
		{
			value = "content/ui/materials/bars/plain_thin_fill",
			style_id = "timer_bar",
			pass_type = "texture",
			style = ViewStyles.timer_bar_fill_style
		},
		{
			value = "content/ui/materials/bars/plain_thin_line",
			pass_type = "texture",
			style = ViewStyles.timer_bar_frame_style
		}
	}, "timer_bar"),
	accept_confirmation = UIWidget.create_definition({
		{
			style_id = "subheader",
			pass_type = "text",
			value = Managers.localization:localize("loc_mission_voting_view_waiting_for_players")
		}
	}, "accept_button", nil, nil, ViewStyles.accept_confirmation),
	toggle_details_button = UIWidget.create_definition(ButtonPassTemplates.secondary_button, "toggle_details_button", {
		text = Managers.localization:localize("loc_mission_voting_view_show_details")
	})
}
local buttons_widget_definitions = {
	accept_button = UIWidget.create_definition(ButtonPassTemplates.default_button_large, "accept_button", {
		text = Managers.localization:localize("loc_mission_voting_view_accept_mission")
	}, nil, ViewStyles.accept_button_style),
	decline_button = UIWidget.create_definition(decline_button_passes, "decline_button", {
		text = Managers.localization:localize("loc_mission_voting_view_decline_mission")
	}, nil, ViewStyles.decline_button_style)
}
local mission_info_widget_definitions = {
	mission_info = UIWidget.create_definition({
		{
			style_id = "mission_title",
			value_id = "mission_title",
			pass_type = "text",
			style = ViewStyles.mission_title_font_style
		}
	}, "mission_info"),
	mission_type = UIWidget.create_definition({
		{
			value_id = "mission_type",
			style_id = "mission_type",
			pass_type = "text",
			value = "",
			style = mission_type_font_style
		}
	}, "mission_type"),
	mission_danger_info = UIWidget.create_definition({
		{
			value_id = "danger_text",
			style_id = "danger_text",
			pass_type = "text",
			value = "",
			style = ViewStyles.mission_title_font_style
		},
		{
			value_id = "danger_icon",
			style_id = "danger_icon",
			pass_type = "texture",
			value = "content/ui/materials/icons/generic/danger",
			style = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				offset = {
					-20,
					10,
					0
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
			value = "content/ui/materials/backgrounds/default_square",
			style_id = "difficulty_icon",
			pass_type = "multi_texture"
		}
	}, "mission_difficulty_resistance", nil, nil, ViewStyles.difficulty),
	rewards_text = UIWidget.create_definition({
		{
			value_id = "rewards_title_text",
			style_id = "rewards_title_text",
			pass_type = "text",
			value = Utf8.upper(Localize("loc_training_grounds_rewards_title")),
			style = ViewStyles.mission_title_font_style
		}
	}, "mission_rewards_challenge"),
	reward_main_mission = UIWidget.create_definition({
		{
			value_id = "reward_main_mission_text",
			style_id = "reward_main_mission_text",
			pass_type = "text",
			value = "",
			style = ViewStyles.rewards_text_style
		}
	}, "reward_main_mission"),
	reward_side_mission = UIWidget.create_definition({
		{
			value_id = "reward_side_mission_text",
			style_id = "reward_side_mission_text",
			pass_type = "text",
			value = "",
			style = ViewStyles.rewards_text_style
		}
	}, "reward_side_mission"),
	mission_info_divider = UIWidget.create_definition({
		{
			pass_type = "rect",
			style = ViewStyles.difficulty_divider
		}
	}, "mission_difficulty_divider")
}
local details_static_widgets_definitions = {
	details_scrollbar = UIWidget.create_definition(ScrollbarPassTemplates.default_scrollbar, "details_scrollbar"),
	details_interaction = UIWidget.create_definition({
		{
			pass_type = "hotspot",
			content_id = "hotspot"
		}
	}, "details_interaction"),
	details_widgets_mask = UIWidget.create_definition({
		{
			value = "content/ui/materials/offscreen_masks/ui_overlay_offscreen_straight_blur_02",
			pass_type = "texture",
			style = {
				color = {
					255,
					255,
					255,
					255
				}
			}
		}
	}, "details_mask")
}
local animations = {
	switch_page = {
		{
			name = "fade_out_old_page",
			end_time = 0.25,
			start_time = 0,
			init = function (parent, ui_scenegraph, scenegraph_definition, widgets, params)
				if params.show_details_flag then
					parent:_play_sound(UISoundEvents.mission_vote_popup_show_details)
				else
					parent:_play_sound(UISoundEvents.mission_vote_popup_hide_details)
				end
			end,
			update = function (parent, ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = 1 - progress
				local widgets_to_fade = parent._additional_widgets

				for i = 1, #widgets_to_fade do
					local widget = widgets_to_fade[i]
					widget.alpha_multiplier = anim_progress
				end
			end
		},
		{
			name = "resize_panels",
			end_time = 0.4,
			start_time = 0.2,
			update = function (parent, ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeCubic(progress)
				local source = params.source_heights
				local targets = params.target_heights
				local lerp = math.lerp
				local mission_info_panel_height = lerp(source.mission_info_panel_height, targets.mission_info_panel_height, anim_progress)
				local zone_image_height = lerp(source.zone_image_height, targets.zone_image_height, anim_progress)
				local body_height = lerp(source.body_height, targets.body_height, anim_progress)
				local body_panel_y_offset = lerp(source.body_y_offset, targets.body_y_offset, anim_progress)
				local inner_panel_height = lerp(source.inner_panel_height, targets.inner_panel_height, anim_progress)
				local outer_panel_height = lerp(source.outer_panel_height, targets.outer_panel_height, anim_progress)
				local outer_panel_y_offset = lerp(source.outer_panel_y_offset, targets.outer_panel_y_offset, anim_progress)
				local bottom_fade_height = lerp(source.zone_image_bottom_fade_height, targets.zone_image_bottom_fade_height, anim_progress)
				local circumstance_icon_height = lerp(source.circumstance_icon_height, targets.circumstance_icon_height, anim_progress)
				ui_scenegraph.mission_info_panel.size[2] = mission_info_panel_height
				ui_scenegraph.body_panel.size[2] = body_height
				ui_scenegraph.body_panel.position[2] = body_panel_y_offset
				ui_scenegraph.inner_panel.size[2] = inner_panel_height
				ui_scenegraph.outer_panel.size[2] = outer_panel_height
				ui_scenegraph.outer_panel.position[2] = outer_panel_y_offset
				ui_scenegraph.zone_image.size[2] = zone_image_height
				ui_scenegraph.zone_image_bottom_fade.size[2] = bottom_fade_height
				ui_scenegraph.circumstance_icon.size[2] = circumstance_icon_height

				return true
			end
		},
		{
			name = "fade_in_widgets",
			end_time = 0.55,
			start_time = 0.35,
			init = function (parent, ui_scenegraph, scenegraph_definition, widgets, params)
				parent:toggle_details(params.show_details_flag, params.input_legend_id)
			end,
			update = function (parent, ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = progress

				math.easeOutCubic(progress)

				local widgets_to_fade = parent._additional_widgets

				for i = 1, #widgets_to_fade do
					local widget = widgets_to_fade[i]
					widget.alpha_multiplier = anim_progress
				end
			end
		}
	}
}

return settings("MissionVotingViewDefinitions", {
	animations = animations,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	mission_info_widget_definitions = mission_info_widget_definitions,
	details_static_widgets_definitions = details_static_widgets_definitions,
	details_widget_spacing = details_widget_spacing,
	details_panel_end_padding = details_panel_end_padding,
	buttons_widget_definitions = buttons_widget_definitions
})
