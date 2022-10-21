local Definitions = require("scripts/ui/views/mission_board_view/mission_board_view_definitions")
local Missions = require("scripts/settings/mission/mission_templates")
local PlayerVisibility = require("scripts/utilities/player_visibility")
local UIRenderer = require("scripts/managers/ui/ui_renderer")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local UIWidget = require("scripts/managers/ui/ui_widget")
local ViewElementMissionInfoPanel = require("scripts/ui/view_elements/view_element_mission_info_panel/view_element_mission_info_panel")
local Blueprints = require("scripts/ui/views/mission_board_view/mission_board_view_blueprints")
local ViewSettings = require("scripts/ui/views/mission_board_view/mission_board_view_settings")
local Zones = require("scripts/settings/zones/zones")
local _timer_format = ViewSettings.time_format

local function _format_timer_text(time)
	local floor = math.floor
	local timer_text = string.format(_timer_format, floor(time / 60) % 60, floor(time) % 60)

	return tostring(timer_text)
end

local function _sort_comparison(a, b)
	return b.content.camera_distance < a.content.camera_distance
end

local MissionBoardView = class("MissionBoardView", "BaseView")

MissionBoardView.init = function (self, settings)
	MissionBoardView.super.init(self, Definitions, settings)
end

MissionBoardView.on_enter = function (self)
	self._allow_close_hotkey = true

	PlayerVisibility.store_and_hide_remote_players()
	self:_create_special_widgets(self._definitions.special_widgets_definition)
	self:_init_widgets()

	self._selected_mission_widget = nil
	self._focused_widget_index = 0
	self._selected_widget_layer = nil
	self._selected_this_frame = false
	self._right_clicked_last_frame = false
	self._recalculate_icon_positions = false
	self._recalculate_min_max_distance = false
	self._recalculate_min_max_distance_frame_counter = 0
	self._min_distance = 0
	self._max_distance = 1
	self._missions_data_version_id = 0
	self._missions_data_expiry_time = 0
	self._icon_name_postfix = 1
	self._active_missions = {}
	self._icon_widgets = {}
	self._icon_widgets_by_grid_pos = {}
	self._icon_widget_definitions = {}
	self._play_icon_show_sound_cooldown = 0
	self._play_icon_hide_sound_cooldown = 0
	self._current_player_level = self:_player_level()
	self._mission_info_panel = nil
	self._zone_data = {}
	self.is_animating_on_enter = false
	self.is_animating_on_exit = false
	self._waiting_for_camera_transition = true

	Managers.event:register(self, "event_mission_board_camera_transition_done", "event_mission_board_camera_transition_done")

	local state_extension = Managers.state.extension
	local mission_board_system = state_extension:system("mission_board_system")
	self._mission_board_system = mission_board_system
	self._mission_board_unit = mission_board_system:mission_board_unit()
	self._mission_board_extension = ScriptUnit.extension(self._mission_board_unit, "mission_board_system")

	mission_board_system:set_group_visibility(false)
	self:_setup_mission_info_panel()
	self:_refresh_missions()
	MissionBoardView.super.on_enter(self)
end

local _no_zones = {}

MissionBoardView.on_exit = function (self)
	Managers.event:unregister(self, "event_mission_board_camera_transition_done")

	local mission_board_unit = self._mission_board_unit

	if mission_board_unit and Unit.alive(mission_board_unit) then
		self:_show_zones(_no_zones)
		self._mission_board_system:set_group_visibility(true)
	end

	self._mission_board_unit = nil
	self._mission_board_extension = nil
	self._mission_board_system = nil

	if not self._mission_to_play then
		self:_play_sound(UISoundEvents.mission_board_exit)
	end

	PlayerVisibility.restore_remote_players()
	MissionBoardView.super.on_exit(self)
end

MissionBoardView.allow_close_hotkey = function (self)
	return not self._selected_mission_widget
end

MissionBoardView.update = function (self, dt, t, input_service)
	local math_min = math.min
	local math_max = math.max
	self._selected_this_frame = false

	self:_update_refresh_missions(dt, t)

	if self._missions_data_version_id > 0 and self._missions_data_version_id ~= self._population_version_id then
		self:_populate_missions_data(t)

		self._population_version_id = self._missions_data_version_id
	end

	if self._is_animating_on_enter then
		local still_animating = self:_fade_widgets(1, dt)
		self._is_animating_on_enter = still_animating

		return
	elseif self._is_animating_on_exit then
		local still_animating = self:_fade_widgets(0, dt)
		self._is_animating_on_exit = still_animating

		return
	end

	if self._recalculate_min_max_distance then
		if self._recalculate_min_max_distance_frame_counter > 0 then
			self._recalculate_min_max_distance_frame_counter = self._recalculate_min_max_distance_frame_counter - 1
		else
			local render_settings = self._render_settings
			local inverse_scale = render_settings.inverse_scale

			self:_calculate_min_max_distance(inverse_scale)

			self._recalculate_min_max_distance = false
			self._recalculate_icon_positions = true
		end
	end

	local selected_widget = self._selected_mission_widget
	local hovered_widget = nil
	local zone_line_increase = dt / ViewSettings.zone_line_draw_time
	local widgets = self._icon_widgets

	for i = #widgets, 1, -1 do
		local widget = widgets[i]
		local fully_expired = self:_update_mission_icon(widget, t)

		if fully_expired then
			self:_remove_expired_widget(widget, i)
		else
			local content = widget.content
			local hotspot = content.hotspot

			if hotspot.is_hover and (not hovered_widget or hovered_widget.offset[3] < widget.offset[3]) then
				if hovered_widget then
					hovered_widget.content.zone_line_progress = math_max(0, content.zone_line_progress - zone_line_increase)
				end

				hovered_widget = widget
			elseif widget ~= selected_widget then
				content.zone_line_progress = math_max(0, content.zone_line_progress - zone_line_increase)
			end
		end
	end

	if hovered_widget then
		local content = hovered_widget.content
		content.zone_line_progress = math_min(1, content.zone_line_progress + zone_line_increase)
	end

	if selected_widget and selected_widget ~= hovered_widget then
		local content = selected_widget.content
		content.zone_line_progress = math_min(1, content.zone_line_progress + zone_line_increase)
	end

	if self._play_icon_show_sound_cooldown > 0 then
		self._play_icon_show_sound = false
		self._play_icon_show_sound_cooldown = self._play_icon_show_sound_cooldown - dt
	elseif self._play_icon_show_sound then
		self:_play_sound(UISoundEvents.mission_board_show_icon)

		self._play_icon_show_sound = false
		self._play_icon_show_sound_cooldown = ViewSettings.show_icon_sound_cooldown
	end

	if self._play_icon_hide_sound_cooldown > 0 then
		self._play_icon_hide_sound = false
		self._play_icon_hide_sound_cooldown = self._play_icon_hide_sound_cooldown - dt
	elseif self._play_icon_hide_sound then
		self:_play_sound(UISoundEvents.mission_board_hide_icon)

		self._play_icon_hide_sound = false
		self._play_icon_hide_sound_cooldown = ViewSettings.hide_icon_sound_cooldown
	end

	if self._notify_navigation_input_changed then
		self:_on_navigation_input_changed()

		self._notify_navigation_input_changed = nil
	end

	if self._recalculate_icon_positions then
		local render_settings = self._render_settings
		local inverse_scale = render_settings.inverse_scale

		for i = 1, #widgets do
			local widget = widgets[i]

			self:_set_icon_position(widget, inverse_scale)
		end

		self:_set_icon_layers(widgets)
	end

	return MissionBoardView.super.update(self, dt, t, input_service)
end

MissionBoardView.draw = function (self, dt, t, input_service, layer)
	MissionBoardView.super.draw(self, dt, t, input_service, layer)
end

MissionBoardView.on_resolution_modified = function (self, scale)
	MissionBoardView.super.on_resolution_modified(self, scale)

	self._recalculate_min_max_distance = true
	self._recalculate_min_max_distance_frame_counter = 1
end

MissionBoardView.trigger_on_enter_animation = function (self)
	MissionBoardView.super.trigger_on_enter_animation(self)

	self._is_animating_on_enter = true
end

MissionBoardView.on_enter_animation_done = function (self)
	return not self._is_animating_on_enter and self:triggered_on_enter_animation()
end

MissionBoardView.trigger_on_exit_animation = function (self)
	MissionBoardView.super.trigger_on_exit_animation(self)

	self._is_animating_on_exit = true
end

MissionBoardView.on_exit_animation_done = function (self)
	return not self._is_animating_on_exit and self:triggered_on_exit_animation()
end

MissionBoardView.cb_select_mission = function (self, widget)
	if widget ~= self._selected_mission_widget and (not self._selected_this_frame or self._selected_widget_layer < widget.offset[3]) then
		self:_set_selected_mission_widget(widget)

		self._selected_widget_layer = widget.offset[3]
		self._right_clicked_last_frame = false
		self._selected_this_frame = true
	end
end

MissionBoardView.cb_on_play_pressed = function (self)
	local widget = self._selected_mission_widget
	local content = widget.content
	local mission_data = content.mission_data
	local backend_mission_id = mission_data.id
	local party_manager = Managers.party_immaterium

	if party_manager:are_all_members_in_hub() then
		party_manager:wanted_mission_selected(backend_mission_id)
	else
		Managers.event:trigger("event_add_notification_message", "alert", "Can't start mission until all party members are in the Mourningstar")
	end

	self._mission_to_play = backend_mission_id

	Managers.ui:close_view(self.view_name)
end

MissionBoardView.event_mission_board_camera_transition_done = function (self)
	self._recalculate_min_max_distance = true
	self._waiting_for_camera_transition = false
end

MissionBoardView._init_widgets = function (self)
	local widgets = self._widgets

	for i = 1, #widgets do
		widgets[i].alpha_multiplier = 0
	end
end

MissionBoardView._fade_widgets = function (self, target, dt)
	local _clamp = math.clamp
	local progress = dt / ViewSettings.view_fade_time * (target * 2 - 1)
	local is_done = true
	local is_waiting_for_camera_transition = self._waiting_for_camera_transition
	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]
		local alpha_multiplier = widget.alpha_multiplier

		if not is_waiting_for_camera_transition or widget.name == "background" then
			alpha_multiplier = _clamp(alpha_multiplier + progress, 0, 1)
			widget.alpha_multiplier = alpha_multiplier
		end

		is_done = is_done and alpha_multiplier == target
	end

	return not is_done
end

MissionBoardView._remove_expired_widget = function (self, widget, index)
	local mission_id = widget.content.mission_data.id
	local selected_mission_widget = self._selected_mission_widget
	local selected_mission_id = selected_mission_widget and selected_mission_widget.content.mission_data.id

	if mission_id == selected_mission_id then
		self:_set_selected_mission_widget(nil)
		self:_focus_next_grid_widget()
	end

	local widget_content = widget.content

	self:_set_widget_at_grid_pos(nil, widget_content.column, widget_content.row)

	self._active_missions[mission_id] = nil
	local widgets = self._icon_widgets
	widgets[index] = widgets[#widgets]

	table.remove(widgets)

	self._population_version_id = self._population_version_id + 1
end

MissionBoardView._on_navigation_input_changed = function (self)
	MissionBoardView.super._on_navigation_input_changed(self)

	local focused_grid_widget = self:_focused_grid_widget()

	if focused_grid_widget then
		focused_grid_widget.content.hotspot.is_selected = focused_grid_widget == self._selected_mission_widget or not self._using_cursor_navigation
	end

	local button_rotate_table_clockwise = self:_localized_input_text("navigate_secondary_left")
	local button_rotate_table_counterclockwise = self:_localized_input_text("navigate_secondary_right")
	local table_rotation_hints = Localize("loc_mission_board_view_table_rotation_hints", true, {
		clockwise = button_rotate_table_clockwise,
		counter_clockwise = button_rotate_table_counterclockwise
	})
	local hint_text_widget = self._widgets_by_name.table_rotation_hint
	hint_text_widget.content.text = table_rotation_hints
end

MissionBoardView._handle_input = function (self, input_service, dt, t)
	self:_handle_input_turn_mission_board(input_service, dt, t)

	local navigation_direction = input_service:get("navigation_axis")

	if Vector3.length_squared(navigation_direction) > 0 then
		self:_handle_navigation_between_icons(navigation_direction)
	end

	if self._right_clicked_last_frame then
		self._right_clicked_last_frame = false

		if not self._mission_info_panel:has_handled_mouse_input() then
			if not self._selected_mission_widget and not self._using_cursor_navigation then
				local focused_widget = self:_focused_grid_widget()

				self:_set_selected_mission_widget(focused_widget)
			else
				self:_set_selected_mission_widget(nil)
			end
		end
	elseif input_service:get("secondary_action_pressed") or input_service:get("back") then
		self._right_clicked_last_frame = true
	end
end

MissionBoardView._handle_input_turn_mission_board = function (self, input_service, dt, t)
	local mission_board_extension = self._mission_board_extension
	local turn_threshold = ViewSettings.input_threshold
	local has_moved = false
	local scroll_axis = input_service:get("scroll_axis")

	if scroll_axis[1] < -turn_threshold or input_service:get("navigate_secondary_left_held") then
		mission_board_extension:move_left()

		has_moved = true
	elseif turn_threshold < scroll_axis[1] or input_service:get("navigate_secondary_right_held") then
		mission_board_extension:move_right()

		has_moved = true
	elseif mission_board_extension:movement() ~= 0 then
		has_moved = true
	end

	self._recalculate_icon_positions = has_moved
end

MissionBoardView._handle_navigation_between_icons = function (self, direction)
	local current_widget = self:_focused_grid_widget()

	if not current_widget then
		return
	end

	local math_abs = math.abs
	local math_huge = math.huge
	direction[2] = -direction[2]
	local direction_normal = Vector3(-direction[2], direction[1], 0)
	local current_widget_offset = current_widget.offset
	local icon_widgets = self._icon_widgets
	local shortest_projection = math_huge
	local shortest_distance = math_huge
	local closest_widget = nil

	for i = 1, #icon_widgets do
		local widget = icon_widgets[i]

		if widget ~= current_widget then
			local hotspot = widget.content.hotspot

			if hotspot and not hotspot.disabled then
				local offset = widget.offset
				local widget_direction = Vector3(offset[1] - current_widget_offset[1], offset[2] - current_widget_offset[2], 0)

				if Vector3.dot(direction, widget_direction) > 0 then
					local projection = math_abs(Vector3.dot(direction_normal, widget_direction))
					local distance_squared = Vector3.length_squared(widget_direction)

					if projection < shortest_projection then
						shortest_projection = projection
						shortest_distance = distance_squared
						closest_widget = widget
					elseif math_abs(projection - shortest_projection) < 0.01 and distance_squared < shortest_distance then
						shortest_projection = projection
						shortest_distance = distance_squared
						closest_widget = widget
					end
				end
			end
		end
	end

	if closest_widget then
		self:_set_selected_mission_widget(closest_widget)
	end
end

local _shown_zones = {}

MissionBoardView._draw_widgets = function (self, dt, t, input_service, ui_renderer)
	MissionBoardView.super._draw_widgets(self, dt, t, input_service, ui_renderer)

	local widgets = self._icon_widgets

	table.clear(_shown_zones)

	local hovered_widget = nil

	for i = 1, #widgets do
		local widget = widgets[i]

		if widget.visible then
			local content = widget.content
			local hotspot = content.hotspot

			if hotspot.is_hover and (not hovered_widget or hovered_widget.offset[3] < widget.offset[3]) then
				hovered_widget = widget
			end

			local zone_line_progress = content.zone_line_progress

			if zone_line_progress == 1 then
				_shown_zones[content.zone_data.map_node] = true

				self:_draw_zone_line(widget, ui_renderer)
			elseif zone_line_progress > 0 then
				self:_draw_zone_line(widget, ui_renderer)
			end

			UIWidget.draw(widget, ui_renderer)
		end
	end

	if hovered_widget then
		self:_draw_icon_info(hovered_widget, ui_renderer)
	end

	self:_show_zones(_shown_zones)
end

MissionBoardView._create_special_widgets = function (self, definitions)
	for widget_name, widget_definition in pairs(definitions) do
		self:_create_widget(widget_name, widget_definition)
	end
end

MissionBoardView._setup_mission_info_panel = function (self)
	local reference_name = "mission_info_panel"
	local layer = 80
	local panel = self:_add_element(ViewElementMissionInfoPanel, reference_name, layer)
	self._mission_info_panel = panel
end

MissionBoardView._refresh_missions = function (self, t)
	self._is_loading = true
	local missions_future = Managers.data_service.mission_board:fetch(nil, 1)

	missions_future:next(function (data)
		self._missions_data = data
		self._missions_data_version_id = self._missions_data_version_id + 1
		self._missions_data_expiry_time = data.expiry_game_time
		self._is_loading = false
	end):catch(function (error)
		Log.error("MissionBoardView", "Fetching missions failed %s", error)

		self._is_loading = false
		self._missions_data_expiry_time = t and t + 5 or 0
	end)
end

MissionBoardView._populate_missions_data = function (self, t)
	local player_level = self._current_player_level
	local widgets = self._icon_widgets
	local active_missions = self._active_missions
	local missions_data = self._missions_data

	if missions_data.happening then
		self._mission_info_panel:set_report_data(missions_data.happening)
	end

	local missions = missions_data.missions
	local i = 1
	local num_missions = #missions

	while i <= num_missions do
		local mission_data = missions[i]
		local mission_id = mission_data.id
		local map_data = rawget(Missions, mission_data.map)

		if not active_missions[mission_id] and map_data then
			local is_locked = player_level < mission_data.required_level

			if t < mission_data.expiry_game_time then
				mission_data.flags.locked = is_locked
				local widget_index = #widgets + 1
				local widget, column, row = self:_create_map_icon_widget(mission_data, map_data)
				widgets[widget_index] = widget

				self:_set_widget_at_grid_pos(widget, column, row)

				active_missions[mission_id] = mission_data
			end
		elseif not map_data then
			Log.exception("MissionBoard", "Backend refers to unknown mission %s", mission_data.map)
		end

		i = i + 1
	end
end

MissionBoardView._player_level = function (self)
	local player = self:_player()
	local profile = player:profile()
	local player_level = profile.current_level

	return player_level
end

MissionBoardView._create_map_icon_widget = function (self, mission_data, map_data)
	local zone_data = self._zone_data[map_data.zone_id]

	if not zone_data then
		zone_data = table.clone(Zones[map_data.zone_id])
		local visibility_group = zone_data.map_node
		self._zone_data[map_data.zone_id] = zone_data
	end

	local widget_blueprint_name = nil
	local flags = mission_data.flags

	if flags.locked then
		widget_blueprint_name = "locked_mission_icon"
	elseif flags.flash then
		widget_blueprint_name = "flash_mission_icon"
	elseif flags.happening_mission then
		widget_blueprint_name = "happening_mission_icon"
	elseif flags.altered then
		widget_blueprint_name = "circumstance_mission_icon"
	else
		widget_blueprint_name = "mission_icon"
	end

	local widget_blueprint = Blueprints[widget_blueprint_name]
	local widget_definition = self._icon_widget_definitions[widget_blueprint_name]

	if not widget_definition then
		local scenegraph_id = "screen"
		widget_definition = UIWidget.create_definition(widget_blueprint.pass_template, scenegraph_id, widget_blueprint.content_overrides, widget_blueprint.size, widget_blueprint.style)
		self._icon_widget_definitions[widget_blueprint_name] = widget_definition
	end

	local name_postfix = self._icon_name_postfix
	local widget_name = "mission_icon_" .. name_postfix
	self._icon_name_postfix = name_postfix + 1
	local column, row = self:_get_cell_for_mission_icon(mission_data)
	local widget = self:_create_widget(widget_name, widget_definition)
	local widget_content = widget.content
	local hotspot = widget_content.hotspot
	local on_select_callback = callback(self, "cb_select_mission", widget)

	local function right_pressed_callback()
		if hotspot.is_hover then
			self._right_clicked_last_frame = false
		end
	end

	widget_blueprint.init(widget, mission_data, zone_data, column, row, on_select_callback, right_pressed_callback)

	local mission_board_extension = self._mission_board_extension

	if mission_board_extension and zone_data and zone_data.map_node then
		local zone_node_index = mission_board_extension:node_index(zone_data.map_node)
		widget_content.zone_node_index = zone_node_index
	end

	return widget, column, row
end

MissionBoardView._set_icon_position = function (self, widget, inverse_scale)
	local node_name = widget.content.node_name
	local node_camera_pos_x, node_camera_pos_y, camera_distance = self:_camera_position_for_node(node_name, inverse_scale)
	local widget_content = widget.content
	widget_content.camera_distance = camera_distance
	local widget_scale = math.auto_lerp(self._min_distance, self._max_distance, ViewSettings.closest_icon_scale, ViewSettings.furthest_icon_scale, camera_distance)

	self:_scale_icon(widget, widget_scale)

	local anchor_point_offset = widget.content.anchor_point_offset
	widget.offset[1] = node_camera_pos_x + anchor_point_offset[1]
	widget.offset[2] = node_camera_pos_y + anchor_point_offset[2]

	return camera_distance
end

MissionBoardView._icon_position = function (self, widget)
	local content = widget.content
	local widget_offset = widget.offset
	local widget_pos_x = widget_offset[1] - content.anchor_point_offset[1]
	local widget_pos_y = widget_offset[2] - content.anchor_point_offset[2]

	return widget_pos_x, widget_pos_y
end

MissionBoardView._set_icon_layers = function (self, widgets)
	local icon_layer_step = ViewSettings.icon_layer_step

	table.sort(widgets, _sort_comparison)

	for i = 1, #widgets do
		local widget = widgets[i]
		local layer = (i - 1) * icon_layer_step
		widget.offset[3] = layer
	end
end

MissionBoardView._scale_icon = function (self, widget, scale)
	local content = widget.content
	local style = widget.style
	content.anchor_point_offset[1] = style.anchor_point_offset[1] * scale
	content.anchor_point_offset[2] = style.anchor_point_offset[2] * scale
	content.size[1] = style.size[1] * scale
	content.size[2] = style.size[2] * scale
	content.info_anchor_point_offset[1] = style.info_anchor_point_offset[1] * scale
	content.info_anchor_point_offset[2] = style.info_anchor_point_offset[2] * scale
	local hotspot_style = style.hotspot
	hotspot_style.size[1] = hotspot_style.orig_size[1] * scale
	hotspot_style.size[2] = hotspot_style.orig_size[2] * scale
	hotspot_style.offset[2] = hotspot_style.orig_offset[2] * scale
end

MissionBoardView._calculate_min_max_distance = function (self, inverse_scale)
	local min_distance = math.huge
	local max_distance = 0
	local grid_size = ViewSettings.grid_size
	local node_name_format = ViewSettings.node_name_format

	for row = 1, grid_size[2] do
		for column = 1, grid_size[1] do
			local node_name = string.format(node_name_format, column, row)
			local _, _, camera_distance = self:_camera_position_for_node(node_name, inverse_scale)

			if camera_distance < min_distance then
				min_distance = camera_distance
			elseif max_distance < camera_distance then
				max_distance = camera_distance
			end
		end

		self._min_distance = min_distance
		self._max_distance = max_distance
	end
end

MissionBoardView._camera_position_for_node = function (self, node_name, inverse_scale)
	local mission_board_extension = self._mission_board_extension
	local node_position = mission_board_extension:node_position(node_name)
	local camera_manager = Managers.state.camera
	local viewport = self:_player_viewport()
	local node_camera_pos_x, node_camera_pos_y, camera_distance = camera_manager:world_to_screen_position(viewport, node_position)
	node_camera_pos_x = node_camera_pos_x * inverse_scale
	node_camera_pos_y = node_camera_pos_y * inverse_scale

	return node_camera_pos_x, node_camera_pos_y, camera_distance
end

MissionBoardView._set_selected_mission_widget = function (self, widget)
	if widget then
		local content = widget.content
		local mission_data = content.mission_data
		local is_selected = self._mission_info_panel:set_active_mission(mission_data, callback(self, "cb_on_play_pressed"))
		widget.content.hotspot.is_selected = is_selected

		if not is_selected then
			return
		end
	else
		self._mission_info_panel:set_active_mission(nil)
	end

	if self._selected_mission_widget then
		local hotspot = self._selected_mission_widget.content.hotspot
		hotspot.is_selected = false
	end

	self._selected_mission_widget = widget

	self:_set_focused_grid_widget(widget)
end

MissionBoardView._update_refresh_missions = function (self, dt, t)
	local refresh_in = self._missions_data_expiry_time - t
	local status_widget = self._widgets_by_name.refresh_status

	if self._is_loading then
		status_widget.content.text = self:_localize("loc_mission_board_view_syncing")
	elseif refresh_in > 0 then
		if math.floor(refresh_in) == 3 and not self._played_refresh_warning_sound then
			self:_play_sound(UISoundEvents.mission_board_receiving_soon)

			self._played_refresh_warning_sound = true
		end

		local time_left = {
			minutes = math.floor(refresh_in / 60),
			seconds = math.floor(refresh_in) % 60
		}
		status_widget.content.text = self:_localize("loc_mission_board_view_time_til_next_sync", true, time_left)
	else
		self:_play_sound(UISoundEvents.mission_board_receiving)
		self:_refresh_missions(t)

		self._played_refresh_warning_sound = false
	end
end

MissionBoardView._update_mission_icon = function (self, widget, time)
	local content = widget.content
	local data = content.mission_data
	local expiry = data.expiry_game_time
	local time_left = expiry - time
	local expired = time_left < 0
	local inactive = time < data.start_game_time
	local hotspot = content.hotspot
	local hotspot_disabled = hotspot.disabled

	if hotspot_disabled and not inactive and not expired then
		widget.visible = true
		hotspot.disabled = false

		self:_animate_widget(widget, "show_icon")

		self._play_icon_show_sound = true
		self._recalculate_icon_positions = true
		self._notify_navigation_input_changed = true
	elseif expired and not hotspot_disabled then
		hotspot.disabled = true

		self:_animate_widget(widget, "hide_icon")

		self._play_icon_hide_sound = true

		if widget == self:_focused_grid_widget() then
			self:_focus_next_grid_widget()
		end
	end

	content.time_left = time_left

	return expired and not widget.visible
end

MissionBoardView._draw_icon_info = function (self, widget, ui_renderer)
	local info_widget = self._widgets_by_name.icon_info
	local widget_content = widget.content

	if widget_content.hotspot.disabled then
		return
	end

	local info_widget_content = info_widget.content
	local formatted_time = _format_timer_text(math.max(widget_content.time_left, 0))
	info_widget_content.tag_reward = widget_content.tag_reward
	info_widget_content.tag_xp = widget_content.tag_xp
	info_widget_content.tag_timer = formatted_time
	local widget_pos_x, widget_pos_y = self:_icon_position(widget)
	local info_offset = widget_content.info_anchor_point_offset
	local info_widget_size = info_widget_content.size
	info_widget.offset[1] = widget_pos_x + info_offset[1] - info_widget_size[1]
	info_widget.offset[2] = widget_pos_y + info_offset[2] - info_widget_size[2]

	UIWidget.draw(info_widget, ui_renderer)
end

MissionBoardView._show_zones = function (self, shown_zones)
	local zone_data = self._zone_data

	for _, data in pairs(zone_data) do
		local map_node = data.map_node
		local is_visible = shown_zones[map_node]

		if not data.is_visible and is_visible then
			local event = string.format("lua_mission_board_show_%s", map_node)

			Unit.flow_event(self._mission_board_unit, event)

			data.is_visible = true
		elseif data.is_visible and not is_visible then
			local event = string.format("lua_mission_board_hide_%s", map_node)

			Unit.flow_event(self._mission_board_unit, event)

			data.is_visible = false
		end
	end
end

MissionBoardView._draw_zone_line = function (self, widget, ui_renderer)
	local mission_board_unit = self._mission_board_unit

	if not mission_board_unit then
		return
	end

	local content = widget.content
	local zone_node_name = content.zone_data.map_node

	if not zone_node_name then
		return
	end

	local inverse_scale = ui_renderer.inverse_scale
	local zone_node_camera_pos_x, zone_node_camera_pos_y = self:_camera_position_for_node(zone_node_name, inverse_scale)
	local node_name = content.node_name
	local icon_node_camera_pos_x, icon_node_camera_pos_y = self:_camera_position_for_node(node_name, inverse_scale)
	local zone_line = self._widgets_by_name.zone_line
	local world_pos = self:_scenegraph_world_position(zone_line.scenegraph_id, inverse_scale)
	zone_line.offset[1] = icon_node_camera_pos_x - world_pos[1]
	zone_line.offset[2] = icon_node_camera_pos_y - world_pos[2]
	local angle = math.angle(icon_node_camera_pos_x, icon_node_camera_pos_y, zone_node_camera_pos_x, zone_node_camera_pos_y)
	local line_style = zone_line.style.line
	line_style.angle = -angle
	local line_length = math.distance_2d(icon_node_camera_pos_x, icon_node_camera_pos_y, zone_node_camera_pos_x, zone_node_camera_pos_y)
	line_style.size[1] = line_length * content.zone_line_progress

	UIWidget.draw(zone_line, ui_renderer)
end

MissionBoardView._animate_widget = function (self, widget, animation_name)
	local playing_animation = widget.content.animation_id

	if playing_animation and self:_is_animation_active(playing_animation) then
		self:_complete_animation(playing_animation)
	end

	local params = {
		widget = widget
	}
	local animation_id = self:_start_animation(animation_name, nil, params)
	widget.content.animation_id = animation_id
end

local _NUM_COLUMNS = ViewSettings.grid_size[1]
local _NUM_ROWS = ViewSettings.grid_size[2]

MissionBoardView._get_widget_at_grid_pos = function (self, column, row)
	local index = row * _NUM_COLUMNS + column

	return self._icon_widgets_by_grid_pos[index]
end

MissionBoardView._set_widget_at_grid_pos = function (self, widget, column, row)
	local index = row * _NUM_COLUMNS + column
	self._icon_widgets_by_grid_pos[index] = widget
end

MissionBoardView._get_cell_for_mission_icon = function (self, mission_data)
	local row = math.ceil((mission_data.resistance + mission_data.challenge) / 2)

	assert(row <= _NUM_ROWS)

	local mission_id = mission_data.id
	local last_part = mission_id:sub(-8)
	last_part = tonumber(last_part, 16)
	local k = ViewSettings.icon_placement_k
	local v = ViewSettings.icon_placement_v
	local column = last_part * v

	for i = 1, k do
		column = (column + v) % k

		if column < _NUM_COLUMNS and not self:_get_widget_at_grid_pos(column + 1, row) then
			return column + 1, row
		end
	end

	return nil, nil
end

MissionBoardView._focused_grid_widget = function (self)
	local widget = self._icon_widgets[self._focused_widget_index]
	widget = widget or self:_focus_next_grid_widget()

	return widget
end

MissionBoardView._set_focused_grid_widget = function (self, widget_to_focus)
	local icon_widgets = self._icon_widgets
	widget_to_focus = widget_to_focus or icon_widgets[self._focused_widget_index]

	if widget_to_focus then
		if widget_to_focus == icon_widgets[self._focused_widget_index] then
			return
		end

		for i = 1, #icon_widgets do
			local icon_widget = icon_widgets[i]
			local icon_widget_hotspot = icon_widget.content.hotspot

			if icon_widget == widget_to_focus then
				self._focused_widget_index = i
				local is_focused = icon_widget == self._selected_mission_widget or not self._using_cursor_navigation
				icon_widget_hotspot.is_selected = is_focused
			else
				icon_widget_hotspot.is_selected = false
			end
		end
	else
		self:_focus_next_grid_widget()
	end
end

MissionBoardView._focus_next_grid_widget = function (self)
	local icon_widgets = self._icon_widgets
	local old_widget = icon_widgets[self._focused_widget_index] or icon_widgets[#icon_widgets]

	if not old_widget then
		return nil
	end

	old_widget.content.hotspot.is_selected = false
	local old_widget_offset = old_widget.offset
	local closest_distance = math.huge
	local closest_widget, closest_widget_index = nil

	for i = 1, #icon_widgets do
		local widget = icon_widgets[i]

		if widget ~= old_widget then
			local hotspot = widget.content.hotspot

			if hotspot and not hotspot.disabled then
				hotspot.is_selected = false
				local offset = widget.offset
				local horizontal_distance = offset[1] - old_widget_offset[1]
				local vertical_distance = offset[2] - old_widget_offset[2]
				local distance_squared = horizontal_distance^2 + vertical_distance^2

				if closest_distance > distance_squared then
					closest_widget = widget
					closest_distance = distance_squared
					closest_widget_index = i
				end
			end
		end
	end

	if closest_widget then
		self._focused_widget_index = closest_widget_index

		if not self._using_cursor_navigation then
			closest_widget.content.hotspot.is_selected = true
		end
	end

	return closest_widget
end

MissionBoardView._test_function = function (self, dt, t, input_service, ui_renderer)
	local w = RESOLUTION_LOOKUP.width
	local h = RESOLUTION_LOOKUP.height
	local draw_layer = 10
	local inverse_scale = ui_renderer.inverse_scale
	local max_height = 10
	local wave_length = 20
	local start_offset_y = 50
	local speed = 2

	for i = 1, w do
		local x = i
		local fraction = i / max_height % 1

		Application.time_since_launch()

		local height = max_height * math.sin(t * speed)
		local y = max_height * math.sin(x / wave_length - t * speed)
		y = wave_length - math.abs(i % (2 * wave_length) - wave_length) - y
		local color = {
			255,
			255,
			255,
			255
		}
		local position = Vector3(x * inverse_scale, (start_offset_y + y) * inverse_scale, draw_layer)
		local size = Vector2(1 * inverse_scale, 1 * inverse_scale)

		UIRenderer.draw_rect(ui_renderer, position, size, color)
	end
end

return MissionBoardView