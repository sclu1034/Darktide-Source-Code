local UIFontSettings = require("scripts/managers/ui/ui_font_settings")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local UIWorkspaceSettings = require("scripts/settings/ui/ui_workspace_settings")
local ButtonPassTemplates = require("scripts/ui/pass_templates/button_pass_templates")
local ColorUtilities = require("scripts/utilities/ui/colors")
local card_width = 530
local icon_background_width = 170
local content_margin = 40
local wallet_panel_frame_size = {
	216,
	44
}
local currency_icon_size = {
	52,
	44
}
local start_color = {
	0,
	128,
	128,
	128
}
local dimmed_out_color = {
	255,
	128,
	128,
	128
}
local in_focus_color = {
	255,
	255,
	255,
	255
}
local end_player_view_styles = {
	wallet_spacing = 25,
	card_folded_height = 65,
	card_normal_height = 375,
	card_fully_expanded_offset_y = -95,
	card_content_empty_row_height = 40,
	card_content_text_offset_y = 170,
	card_fully_expanded_height = 515,
	card_width = card_width,
	card_offset_x = card_width + 70,
	wallet_panel_size = wallet_panel_frame_size,
	item_insignia_size = {
		30,
		80
	},
	item_portrait_frame_size = {
		60,
		70
	},
	progress_bar = {}
}
local progress_bar_style = end_player_view_styles.progress_bar
progress_bar_style.size = {
	1300,
	18
}
progress_bar_style.current_level_text = table.clone(UIFontSettings.grid_title)
local current_level_text_style = progress_bar_style.current_level_text
current_level_text_style.font_size = 55
current_level_text_style.material = "content/ui/materials/font_gradients/slug_font_gradient_header"
current_level_text_style.text_horizontal_alignment = "right"
progress_bar_style.next_level_text = table.clone(current_level_text_style)
local next_level_text_style = progress_bar_style.next_level_text
next_level_text_style.text_horizontal_alignment = "left"
progress_bar_style.character_progress_text = table.clone(UIFontSettings.body_small)
local character_progress_text_style = progress_bar_style.character_progress_text
character_progress_text_style.text_horizontal_alignment = "right"
end_player_view_styles.experience_gain = {}
local experience_gain_style = end_player_view_styles.experience_gain
experience_gain_style.rect = {}
experience_gain_rect_style = experience_gain_style.rect
experience_gain_rect_style.size = {
	2,
	35
}
experience_gain_rect_style.vertical_alignment = "bottom"
experience_gain_rect_style.offset = {
	0,
	30,
	0
}
experience_gain_rect_style.color = Color.ui_terminal(255, true)
experience_gain_style.text = table.clone(UIFontSettings.body_small)
local experience_gain_text_style = experience_gain_style.text
experience_gain_text_style.size = {
	nil,
	18
}
experience_gain_text_style.text_horizontal_alignment = "right"
experience_gain_text_style.vertical_alignment = "bottom"
experience_gain_text_style.offset = {
	-8,
	28,
	0
}
experience_gain_text_style.text_color = Color.ui_terminal(255, true)
end_player_view_styles.wallet_panel = {}
local wallet_panel_style = end_player_view_styles.wallet_panel
wallet_panel_style.background = {}
local wallet_panel_background_style = wallet_panel_style.background
wallet_panel_background_style.vertical_alignment = "center"
wallet_panel_background_style.horizontal_alignment = "center"
wallet_panel_background_style.size = {
	185,
	35
}
wallet_panel_background_style.color = Color.black(128, true)
wallet_panel_style.frame = {}
local wallet_panel_frame_style = wallet_panel_style.frame
wallet_panel_frame_style.offset = {
	0,
	0,
	1
}
wallet_panel_style.currency_icon = {}
local wallet_panel_currency_icon_style = wallet_panel_style.currency_icon
wallet_panel_currency_icon_style.size = currency_icon_size
wallet_panel_currency_icon_style.vertical_alignment = "center"
wallet_panel_currency_icon_style.offset = {
	25,
	0,
	2
}
wallet_panel_style.text = table.clone(UIFontSettings.body)
local wallet_panel_text_style = wallet_panel_style.text
wallet_panel_text_style.text_horizontal_alignment = "right"
wallet_panel_text_style.text_vertical_alignment = "center"
wallet_panel_text_style.offset = {
	-28,
	0,
	3
}
end_player_view_styles.blueprints = {}
local blueprint_styles = end_player_view_styles.blueprints
blueprint_styles.pass_styles = {}
local blueprint_pass_styles = blueprint_styles.pass_styles
blueprint_pass_styles.item_icon_landscape = {}
local item_icon_landscape_style = blueprint_pass_styles.item_icon_landscape
item_icon_landscape_style.size = {
	192,
	128
}
item_icon_landscape_style.material_values = {
	use_placeholder_texture = 1
}
item_icon_landscape_style.hdr = false
item_icon_landscape_style.horizontal_alignment = "center"
item_icon_landscape_style.offset = {
	0,
	104,
	2
}
item_icon_landscape_style.offset_original = table.clone(item_icon_landscape_style.offset)
item_icon_landscape_style.offset_compressed = {
	0,
	88,
	2
}
item_icon_landscape_style.color = start_color
item_icon_landscape_style.sound_event_on_show = UISoundEvents.end_screen_summary_reward_in
blueprint_pass_styles.item_icon_portrait = table.clone(item_icon_landscape_style)
local item_icon_portrait_style = blueprint_pass_styles.item_icon_portrait
item_icon_portrait_style.size = {
	128,
	192
}
item_icon_portrait_style.offset = {
	0,
	72,
	2
}
item_icon_portrait_style.offset_original = nil
item_icon_portrait_style.offset_compressed = nil
blueprint_pass_styles.item_icon_square = table.clone(item_icon_landscape_style)
local item_icon_square_style = blueprint_pass_styles.item_icon_square
item_icon_square_style.size = {
	128,
	128
}
blueprint_styles.card_content = {}
local card_content_styles = blueprint_styles.card_content
card_content_styles.text_normal = table.clone(UIFontSettings.body)
local card_content_normal_text_style = card_content_styles.text_normal
card_content_normal_text_style.offset = {
	content_margin,
	nil,
	2
}
card_content_normal_text_style.size = {
	card_width - content_margin * 2,
	30
}
card_content_normal_text_style.text_color = start_color
card_content_styles.text_small = table.clone(UIFontSettings.body_small)
local card_content_small_text_style = card_content_styles.text_small
card_content_small_text_style.offset = {
	content_margin,
	nil,
	2
}
card_content_small_text_style.size = {
	card_width - content_margin * 2,
	25
}
card_content_small_text_style.text_color = start_color
local card_frame_style = {
	start_color = start_color,
	dimmed_out_color = dimmed_out_color,
	in_focus_color = in_focus_color,
	dimmed_out_text_color = Color.ui_grey_medium(255, true),
	dimmed_out_gradiented_text_color = {
		255,
		192,
		192,
		192
	},
	in_focus_text_color = table.clone(UIFontSettings.body.default_color),
	folded_size = end_player_view_styles.card_folded_size,
	background = {}
}
local card_background_style = card_frame_style.background
card_background_style.offset = {
	15,
	0,
	0
}
card_background_style.size_addition = {
	-(card_background_style.offset[1] * 2),
	-(card_background_style.offset[2] + 20)
}
card_background_style.color = Color.black(192, true)
card_background_style.vertical_alignment = "top"
card_frame_style.frame_top = {}
local card_frame_top_style = card_frame_style.frame_top
card_frame_top_style.size = {
	530,
	200
}
card_frame_top_style.offset = {
	0,
	-180,
	3
}
card_frame_style.frame_middle = {}
local card_frame_middle_style = card_frame_style.frame_middle
card_frame_middle_style.size = {
	530
}
card_frame_middle_style.size_addition = {
	0,
	-20
}
card_frame_middle_style.vertical_alignment = "bottom"
card_frame_middle_style.offset = {
	0,
	-40,
	1
}
card_frame_style.frame_bottom = {}
local card_frame_bottom_style = card_frame_style.frame_bottom
card_frame_bottom_style.size = {
	530,
	53
}
card_frame_bottom_style.vertical_alignment = "bottom"
card_frame_bottom_style.offset = {
	0,
	0,
	3
}
card_frame_style.label = table.clone(UIFontSettings.grid_title)
local card_label_style = card_frame_style.label
card_label_style.font_size = 36
card_label_style.size = {
	476,
	85
}
card_label_style.horizontal_alignment = "center"
card_label_style.offset = {
	0,
	-97,
	4
}
card_label_style.text_color = start_color
blueprint_styles.experience_card = table.clone(card_frame_style)
local xp_card_style = blueprint_styles.experience_card
xp_card_style.experience_icon_background = {}
local xp_icon_bg_style = xp_card_style.experience_icon_background
xp_icon_bg_style.start_width = 0
xp_icon_bg_style.target_width = icon_background_width
xp_icon_bg_style.size = {
	xp_icon_bg_style.start_width,
	xp_icon_bg_style.start_width
}
xp_icon_bg_style.horizontal_alignment = "center"
xp_icon_bg_style.offset = {
	0,
	0,
	1
}
xp_icon_bg_style.color = start_color
xp_card_style.experience_icon = {}
local xp_icon_style = xp_card_style.experience_icon
xp_icon_style.horizontal_alignment = "center"
xp_icon_style.size = currency_icon_size
xp_icon_style.offset = {
	0,
	(icon_background_width - xp_icon_style.size[2]) / 2,
	2
}
xp_icon_style.color = start_color
blueprint_styles.salary_card = table.clone(card_frame_style)
local salary_card_styles = blueprint_styles.salary_card
salary_card_styles.credits_icon_background = table.clone(xp_icon_bg_style)
local credits_icon_background_style = salary_card_styles.credits_icon_background
credits_icon_background_style.offset[1] = -icon_background_width * 0.75
salary_card_styles.credits_icon = table.clone(xp_icon_style)
local salary_card_credits_icon_style = salary_card_styles.credits_icon
salary_card_credits_icon_style.offset[1] = credits_icon_background_style.offset[1] + xp_icon_style.offset[1]
salary_card_styles.plasteel_icon_background = table.clone(xp_icon_bg_style)
salary_card_styles.plasteel_icon = table.clone(xp_icon_style)
salary_card_styles.diamantine_icon_background = table.clone(xp_icon_bg_style)
local diamantine_icon_background_style = salary_card_styles.diamantine_icon_background
diamantine_icon_background_style.offset[1] = icon_background_width * 0.75
salary_card_styles.diamantine_icon = table.clone(xp_icon_style)
local salary_card_diamantine_icon_style = salary_card_styles.diamantine_icon
salary_card_diamantine_icon_style.offset[1] = diamantine_icon_background_style.offset[1] + xp_icon_style.offset[1]
blueprint_styles.item_reward_card = table.clone(card_frame_style)
local item_reward_card_style = blueprint_styles.item_reward_card
item_reward_card_style.item_display_name = table.clone(UIFontSettings.grid_title)
local item_reward_item_name_style = item_reward_card_style.item_display_name
item_reward_item_name_style.text_horizontal_alignment = "center"
item_reward_item_name_style.text_vertical_alignment = "bottom"
item_reward_item_name_style.offset = {
	content_margin,
	8,
	2
}
item_reward_item_name_style.size = {
	card_width - content_margin * 2,
	60
}
item_reward_item_name_style.text_color = start_color
item_reward_card_style.item_sub_display_name = table.clone(UIFontSettings.body)
local item_reward_item_sub_name_style = item_reward_card_style.item_sub_display_name
item_reward_item_sub_name_style.text_horizontal_alignment = "center"
item_reward_item_sub_name_style.offset = {
	content_margin,
	264,
	2
}
item_reward_item_sub_name_style.size = {
	card_width - content_margin * 2,
	60
}
item_reward_item_sub_name_style.text_color = start_color
blueprint_styles.level_up_card = table.clone(item_reward_card_style)
local level_up_card_style = blueprint_styles.level_up_card
level_up_card_style.level_up_frame = {}
local level_up_card_frame_style = level_up_card_style.level_up_frame
level_up_card_frame_style.size_addition = {
	110,
	249 - card_frame_top_style.offset[2]
}
level_up_card_frame_style.offset = {
	-55,
	-44 + card_frame_top_style.offset[2],
	2
}
level_up_card_frame_style.color = start_color
local level_up_item_sub_display_name = level_up_card_style.item_sub_display_name
level_up_item_sub_display_name.offset_original = table.clone(level_up_item_sub_display_name.offset)
level_up_item_sub_display_name.offset_compressed = {
	content_margin,
	level_up_item_sub_display_name.offset[2] - 96,
	2
}
level_up_card_style.unlocked_talents_label = table.clone(UIFontSettings.header_5)
local unlocked_talents_label_style = level_up_card_style.unlocked_talents_label
unlocked_talents_label_style.text_horizontal_alignment = "center"
unlocked_talents_label_style.offset = {
	0,
	320,
	2
}
unlocked_talents_label_style.offset_original = table.clone(unlocked_talents_label_style.offset)
unlocked_talents_label_style.offset_compressed = {
	0,
	unlocked_talents_label_style.offset[2] - 96,
	2
}
unlocked_talents_label_style.text_color = start_color
unlocked_talents_label_style.sound_event_on_show = UISoundEvents.end_screen_summary_talents_unlocked
level_up_card_style.talent_group_name = table.clone(item_reward_item_name_style)
local talent_group_name_style = level_up_card_style.talent_group_name
talent_group_name_style.size = {
	nil,
	25
}
talent_group_name_style.vertical_alignment = "top"
talent_group_name_style.offset = {
	0,
	350,
	2
}
talent_group_name_style.offset_original = table.clone(talent_group_name_style.offset)
talent_group_name_style.offset_compressed = {
	0,
	talent_group_name_style.offset[2] - 96,
	2
}
level_up_card_style.talent_icon_center = {}
local talent_icon_center_style = level_up_card_style.talent_icon_center
talent_icon_center_style.size = {
	110,
	110
}
talent_icon_center_style.horizontal_alignment = "center"
talent_icon_center_style.offset = {
	0,
	370,
	1
}
talent_icon_center_style.offset_original = table.clone(talent_icon_center_style.offset)
talent_icon_center_style.offset_compressed = {
	0,
	talent_icon_center_style.offset[2] - 92,
	2
}
talent_icon_center_style.color = start_color
level_up_card_style.talent_icon_left = table.clone(talent_icon_center_style)
local talent_icon_left_style = level_up_card_style.talent_icon_left
talent_icon_left_style.offset[1] = -125
talent_icon_left_style.offset_original[1] = talent_icon_left_style.offset[1]
talent_icon_left_style.offset_compressed[1] = -70
level_up_card_style.talent_icon_right = table.clone(talent_icon_center_style)
local talent_icon_right_style = level_up_card_style.talent_icon_right
talent_icon_right_style.offset[1] = 125
talent_icon_right_style.offset_original[1] = talent_icon_right_style.offset[1]
talent_icon_right_style.offset_compressed[1] = 70
level_up_card_style.talent_icon_frame_center = table.clone(talent_icon_center_style)
local talent_icon_frame_center_style = level_up_card_style.talent_icon_frame_center
talent_icon_frame_center_style.offset[3] = 3
level_up_card_style.talent_icon_frame_left = table.clone(talent_icon_left_style)
local talent_icon_left_frame_style = level_up_card_style.talent_icon_frame_left
talent_icon_left_frame_style.offset[3] = 3
level_up_card_style.talent_icon_frame_right = table.clone(talent_icon_right_style)
local talent_icon_frame_right_style = level_up_card_style.talent_icon_frame_right
talent_icon_frame_right_style.offset[3] = 3
local talents_only_icon_offset_y = 82
blueprint_styles.level_up_talents_only_card = table.clone(level_up_card_style)
local level_up_talents_only_card_style = blueprint_styles.level_up_talents_only_card
local talents_only_unlocked_talents_label_style = level_up_talents_only_card_style.unlocked_talents_label
talents_only_unlocked_talents_label_style.offset[2] = 32
local talents_only_talent_group_name_style = level_up_talents_only_card_style.talent_group_name
talents_only_talent_group_name_style.offset[2] = 62
local talents_only_talent_icon_center_style = level_up_talents_only_card_style.talent_icon_center
talents_only_talent_icon_center_style.offset[2] = talents_only_icon_offset_y
level_up_talents_only_card_style.talent_icon_left = table.clone(talent_icon_left_style)
local talents_only_talent_icon_left_style = level_up_talents_only_card_style.talent_icon_left
talents_only_talent_icon_left_style.offset[2] = talents_only_icon_offset_y
level_up_talents_only_card_style.talent_icon_right = table.clone(talent_icon_right_style)
local talents_only_talent_icon_right_style = level_up_talents_only_card_style.talent_icon_right
talents_only_talent_icon_right_style.offset[2] = talents_only_icon_offset_y
level_up_talents_only_card_style.talent_icon_frame_center = table.clone(talent_icon_frame_center_style)
local talents_only_talent_icon_frame_center_style = level_up_talents_only_card_style.talent_icon_frame_center
talents_only_talent_icon_frame_center_style.offset[2] = talents_only_icon_offset_y
level_up_talents_only_card_style.talent_icon_frame_left = table.clone(talent_icon_left_frame_style)
local talents_only_talent_icon_left_frame_style = level_up_talents_only_card_style.talent_icon_frame_left
talents_only_talent_icon_left_frame_style.offset[2] = talents_only_icon_offset_y
level_up_talents_only_card_style.talent_icon_frame_right = table.clone(talent_icon_frame_right_style)
local talents_only_talent_icon_frame_right_style = level_up_talents_only_card_style.talent_icon_frame_right
talents_only_talent_icon_frame_right_style.offset[2] = talents_only_icon_offset_y
blueprint_styles.empty_test_card = table.clone(card_frame_style)

return settings("EndPlayerViewStyles", end_player_view_styles)