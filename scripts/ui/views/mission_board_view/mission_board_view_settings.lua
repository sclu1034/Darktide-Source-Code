local MissionBoardViewSettings = {
	resource_renderer_material = "content/ui/materials/mission_board/render_target_scanlines",
	quickplay_vo_profile = "pilot_a",
	fetch_retry_cooldown = 5,
	default_danger = 1,
	resource_renderer_name = "mission_board_view_scanlines_ui_renderer",
	resource_renderer_enabled = false,
	color_background = {
		200,
		0,
		0,
		0
	},
	color_corner = Color.terminal_corner(nil, true),
	color_frame = Color.terminal_frame(nil, true),
	color_main = {
		255,
		169,
		211,
		158
	},
	color_accent = Color.golden_rod(nil, true),
	color_disabled = {
		30,
		78,
		87,
		80
	},
	color_gray = {
		200,
		135,
		153,
		131
	},
	color_cursor = Color.golden_rod(nil, true),
	color_dark_opacity = {
		75,
		0,
		0,
		0
	},
	color_green_faded = {
		128,
		169,
		211,
		158
	},
	color_text_title = Color.terminal_text_header(nil, true),
	color_text_body = Color.terminal_text_body(nil, true),
	mission_positions = {
		{
			1095,
			861,
			index = 1
		},
		{
			506,
			679,
			index = 2
		},
		{
			615,
			881,
			index = 3
		},
		{
			719,
			692,
			index = 4
		},
		{
			173,
			353,
			index = 5
		},
		{
			245,
			775,
			index = 6
		},
		{
			884,
			383,
			index = 7
		},
		{
			1102,
			485,
			index = 8
		},
		{
			788,
			190,
			index = 9
		},
		{
			401,
			323,
			index = 10
		},
		{
			553,
			107,
			index = 11
		},
		{
			933,
			602,
			index = 12
		},
		{
			888,
			836,
			index = 13
		},
		{
			405,
			864,
			index = 14
		},
		{
			1062,
			301,
			index = 15
		},
		{
			281,
			129,
			index = 16
		},
		{
			615,
			297,
			index = 17
		},
		{
			1152,
			669,
			index = 18
		},
		{
			951,
			113,
			index = 19
		}
	},
	flash_mission_position = {
		520,
		480
	},
	quickplay_mission_position = {
		120,
		550
	},
	fluff_frames = {
		"content/ui/materials/fluff/hologram/frames/fluff_frame_01",
		"content/ui/materials/fluff/hologram/frames/fluff_frame_02",
		"content/ui/materials/fluff/hologram/frames/fluff_frame_03",
		"content/ui/materials/fluff/hologram/frames/fluff_frame_04",
		"content/ui/materials/fluff/hologram/frames/fluff_frame_05",
		"content/ui/materials/fluff/hologram/frames/fluff_frame_06",
		"content/ui/materials/fluff/hologram/frames/fluff_frame_07",
		"content/ui/materials/fluff/hologram/frames/fluff_frame_08"
	},
	gamepad_cursor_settings = {
		snap_selection_speed_threshold = 10,
		stickiness_radius = 25,
		widget_drag_coefficient = 0.45,
		bounds_min_y = 50,
		cursor_friction_coefficient = 0.002,
		average_speeed_smoothing = 0.5,
		snap_input_length_threshold = 0.05,
		snap_movement_rate = 0.005,
		stickiness_speed_threshold = 500,
		default_size_y = 135,
		bounds_max_x = 1250,
		size_resize_rate = 0.001,
		bounds_max_y = 950,
		cursor_acceleration = 8000,
		default_size_x = 115,
		arrow_rotate_rate = 0.001,
		snap_delay = 0.1,
		bounds_min_x = 50,
		cursor_minimum_speed = 0.1
	},
	world_spawner_settings = {
		viewport_name = "mission_board_viewport",
		level_name = "content/levels/ui/mission_board/mission_board",
		viewport_shading_environment = "content/shading_environments/ui/mission_board",
		viewport_layer = 1,
		viewport_type = "default",
		world_timer_name = "ui",
		world_layer = 1,
		world_name = "mission_board"
	},
	game_settings = {
		{
			description = "loc_mission_board_toggle_solo_play_description",
			display_name = "loc_mission_board_toggle_solo_play",
			setting_name = "solo_play",
			value_get = function ()
				return true
			end
		},
		{
			description = "loc_mission_board_disable_bots_description",
			display_name = "loc_mission_board_disable_bots",
			setting_name = "solo_play_disable_bots",
			value_get = function ()
				return true
			end
		}
	},
	mission_difficulty_complete_icons = {
		"content/ui/materials/icons/mission_difficulty_complete/difficulty_completed_1",
		"content/ui/materials/icons/mission_difficulty_complete/difficulty_completed_2",
		"content/ui/materials/icons/mission_difficulty_complete/difficulty_completed_3",
		"content/ui/materials/icons/mission_difficulty_complete/difficulty_completed_4",
		"content/ui/materials/icons/mission_difficulty_complete/difficulty_completed_5"
	}
}

return settings("MissionBoardViewSettings", MissionBoardViewSettings)
