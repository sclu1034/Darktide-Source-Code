local Definitions = require("scripts/ui/views/end_view/end_view_definitions")
local Breeds = require("scripts/settings/breed/breeds")
local EndViewSettings = require("scripts/ui/views/end_view/end_view_settings")
local MasterItems = require("scripts/backend/master_items")
local Missions = require("scripts/settings/mission/mission_templates")
local ProfileUtils = require("scripts/utilities/profile_utils")
local ScriptWorld = require("scripts/foundation/utilities/script_world")
local SocialConstants = require("scripts/managers/data_service/services/social/social_constants")
local TextUtilities = require("scripts/utilities/ui/text")
local UIProfileSpawner = require("scripts/managers/ui/ui_profile_spawner")
local UIRenderer = require("scripts/managers/ui/ui_renderer")
local UISettings = require("scripts/settings/ui/ui_settings")
local UIWidget = require("scripts/managers/ui/ui_widget")
local UIWorldSpawner = require("scripts/managers/ui/ui_world_spawner")
local ViewStyles = require("scripts/ui/views/end_view/end_view_styles")
local ViewElementInputLegend = require("scripts/ui/view_elements/view_element_input_legend/view_element_input_legend")
local PartyStatus = SocialConstants.PartyStatus
local _math_clamp01 = math.clamp01
local SUMMARY_VIEW_NAME = "end_player_view"
local EndView = class("EndView", "BaseView")

EndView.init = function (self, settings, context)
	local definitions = Definitions
	self._context = context
	self._can_exit = context and context.can_exit
	self._round_won = context and context.round_won or false
	self._session_report = context and context.session_report
	self._end_player_view_context = {}
	self._human_spawn_point_units = {}
	self._ogryn_spawn_point_units = {}
	self._player_widget_definition = nil
	self._delay_before_summary = EndViewSettings.delay_before_summary
	self._end_time = nil
	self._reference_name = "EndView_" .. tostring(self)

	EndView.super.init(self, definitions, settings)

	self._pass_draw = false
	self._pass_input = true
end

EndView.on_enter = function (self)
	EndView.super.on_enter(self)

	self._widget_alpha = 0
	self._game_mode_condition_widgets = {}

	self:_create_game_mode_condition_widgets()

	local context = self._context

	if context then
		local delay_before_summary = context.delay_before_summary

		if delay_before_summary then
			self._delay_before_summary = delay_before_summary
		end

		self._end_time = context.end_time
		local played_mission = context.played_mission
		local session_report = self._session_report

		self:_set_mission_key(played_mission, session_report)
	end

	local server_time = Managers.time:time("main")
	self._show_player_view_time = (server_time + self._delay_before_summary) * 1000

	self:_setup_background_world()
	self:_setup_input_legend()
end

EndView.on_exit = function (self)
	if Managers.ui:view_active(SUMMARY_VIEW_NAME) then
		Managers.ui:close_view(SUMMARY_VIEW_NAME)
	end

	local ui_renderer = self._ui_renderer
	local game_mode_condition_widgets = self._game_mode_condition_widgets

	for i = 1, #game_mode_condition_widgets do
		local widget = game_mode_condition_widgets[i]

		if widget.content.portrait_load_id then
			self:_unload_portrait_icon(widget, ui_renderer)
		end
	end

	local spawn_slots = self._spawn_slots

	if spawn_slots then
		local num_slots = #spawn_slots

		for i = 1, num_slots do
			local slot = spawn_slots[i]

			if slot.occupied then
				self:_reset_spawn_slot(slot)
			end
		end
	end

	if self._world_spawner then
		self._world_spawner:destroy()

		self._world_spawner = nil
	end

	self:_unregister_event("event_state_game_score_continue")
	EndView.super.on_exit(self)
end

EndView.can_exit = function (self)
	return self._can_exit
end

EndView.allow_close_hotkey = function (self)
	return self._can_exit
end

local _update_alpha_fade_time = EndViewSettings.alpha_fade_time

EndView.update = function (self, dt, t, input_service)
	local world_spawner = self._world_spawner

	if world_spawner then
		world_spawner:update(dt, t)
	end

	local ui_manager = Managers.ui
	local is_showing_player_view = ui_manager:view_active(SUMMARY_VIEW_NAME)
	local session_report = self._session_report
	local end_time = self._end_time
	local show_player_view_time = self._show_player_view_time
	local server_time = Managers.backend:get_server_time(t)

	if not session_report or not end_time then
		local progression_manager = Managers.progression

		if not session_report and not progression_manager:is_fetching_session_report() and progression_manager:session_report_success() then
			session_report = progression_manager:session_report()
			self._session_report = session_report
			local context = self._context

			if context then
				local played_mission = context.played_mission

				self:_set_mission_key(played_mission, session_report)
			end
		end

		if not end_time and session_report then
			end_time = server_time + EndViewSettings.max_duration * 1000
			self._end_time = end_time
			local new_show_player_view_time = server_time + EndViewSettings.min_delay_before_summary * 1000
			show_player_view_time = math.max(show_player_view_time, new_show_player_view_time)
			self._show_player_view_time = show_player_view_time
		end
	end

	if session_report and end_time then
		if show_player_view_time and show_player_view_time < server_time and not is_showing_player_view then
			local character_session_report = self._session_report.character
			local context = self._context
			local summary_view_context = self._end_player_view_context
			summary_view_context.can_exit = false
			summary_view_context.round_won = context.round_won
			summary_view_context.session_report = character_session_report

			Managers.ui:open_view(SUMMARY_VIEW_NAME, nil, nil, nil, nil, summary_view_context)
			self:_register_event("event_state_game_score_continue")

			self._show_player_view_time = nil
		end

		local time = math.max((end_time - server_time) / 1000 + 1, 0)
		local timer_text = self:_get_timer_text(time)

		self:_update_continue_button(timer_text)
	end

	self._widget_alpha = _math_clamp01(self._widget_alpha + dt / _update_alpha_fade_time * (is_showing_player_view and -1 or 1))

	self:_update_player_slots(dt, t, input_service)

	return EndView.super.update(self, dt, t, input_service)
end

local _draw_layer = EndViewSettings.overlay_draw_layer

EndView.draw = function (self, dt, t, input_service, layer)
	layer = _draw_layer

	EndView.super.draw(self, dt, t, input_service, layer)
end

EndView.cb_on_stay_in_party_pressed = function (self)
	Log.info("EndView", "STAY IN PARTY")
end

EndView.cb_on_continue_pressed = function (self)
	self:_trigger_current_presentation_skip()
end

EndView.event_state_game_score_continue = function (self)
	local ui_manager = Managers.ui
	local is_showing_player_view = ui_manager:view_active(SUMMARY_VIEW_NAME)

	if is_showing_player_view then
		ui_manager:close_view(SUMMARY_VIEW_NAME)
	end
end

EndView._handle_input = function (self, input_service, dt, t)
	if input_service:get("next") then
		self:_trigger_current_presentation_skip()
	end

	return EndView.super._handle_input(self, input_service, dt, t)
end

EndView._draw_widgets = function (self, dt, t, input_service, ui_renderer, render_settings)
	EndView.super._draw_widgets(self, dt, t, input_service, ui_renderer, render_settings)

	local camera = self._world_spawner:camera()
	local inverse_scale = ui_renderer.inverse_scale
	local widget_alpha = self._widget_alpha

	if widget_alpha > 0 then
		local game_mode_condition_widgets = self._game_mode_condition_widgets

		for i = 1, #game_mode_condition_widgets do
			local widget = game_mode_condition_widgets[i]
			widget.alpha_multiplier = widget_alpha
			local widget_content = widget.content
			local boxed_position = widget_content.boxed_position

			if boxed_position then
				local position = Vector3Box.unbox(boxed_position)
				local world_to_screen = Camera.world_to_screen(camera, position)
				local widget_offset_x = world_to_screen.x * inverse_scale
				widget.offset[1] = widget_offset_x
			end

			UIWidget.draw(widget, ui_renderer)
		end
	end
end

EndView._create_game_mode_condition_widgets = function (self)
	local game_mode_condition_widget_definitions = self._definitions.game_mode_condition_widget_definitions
	local round_condition_widget_definitions = self._round_won and game_mode_condition_widget_definitions.victory or game_mode_condition_widget_definitions.defeat
	local static_widget_definitions = round_condition_widget_definitions.static
	local widgets = self._widgets

	for name, definition in pairs(static_widget_definitions) do
		widgets[#widgets + 1] = self:_create_widget(name, definition)
	end

	local dynamic_widget_definitions = round_condition_widget_definitions.dynamic
	local game_mode_condition_widgets = self._game_mode_condition_widgets
	local title_text_widget_name = "title_text"
	local title_text_widget_definition = dynamic_widget_definitions[title_text_widget_name]
	game_mode_condition_widgets[#game_mode_condition_widgets + 1] = self:_create_widget(title_text_widget_name, title_text_widget_definition)
	local player_widget_definition_name = "player_panel"
	self._player_widget_definition = dynamic_widget_definitions[player_widget_definition_name]
end

EndView._setup_input_legend = function (self)
	self._input_legend_element = self:_add_element(ViewElementInputLegend, "input_legend", 20)
	local legend_inputs = self._definitions.legend_inputs
	local input_legends_by_key = {}

	for i = 1, #legend_inputs do
		local legend_input = legend_inputs[i]
		local on_pressed_callback = legend_input.on_pressed_callback and callback(self, legend_input.on_pressed_callback)
		local id = self._input_legend_element:add_entry(legend_input.display_name, legend_input.input_action, legend_input.visibility_function, on_pressed_callback, legend_input.alignment)
		local key = legend_input.key

		if key then
			input_legends_by_key[key] = {
				id = id,
				settings = legend_input
			}
		end
	end

	self._input_legends_by_key = input_legends_by_key
end

EndView._update_continue_button = function (self, timer_text)
	local input_legends_by_key = self._input_legends_by_key
	local input_legend = input_legends_by_key.continue
	local input_id = input_legend.id
	local settings = input_legend.settings
	local text = settings.display_name
	local suffix = " (" .. timer_text .. ")"

	self._input_legend_element:set_display_name(input_id, text, suffix)
end

EndView._get_timer_text = function (self, time)
	local floor = math.floor
	local timer_text = string.format("%.2d:%.2d", floor(time / 60) % 60, floor(time) % 60)

	return timer_text
end

EndView._trigger_current_presentation_skip = function (self)
	Managers.event:trigger("event_trigger_current_end_presentation_skip")
end

EndView._setup_background_world = function (self)
	self:_register_event("event_register_end_of_round_camera", "event_register_end_of_round_camera")

	local max_spawn_slots = 4

	for i = 1, max_spawn_slots do
		local event_name_human = "event_register_end_of_round_spawn_point_human_" .. i
		local event_name_ogryn = "event_register_end_of_round_spawn_point_ogryn_" .. i

		self[event_name_human] = function (self, spawn_unit)
			self._human_spawn_point_units[i] = spawn_unit

			self:_unregister_event(event_name_human)

			if table.size(self._human_spawn_point_units) == max_spawn_slots and table.size(self._ogryn_spawn_point_units) == max_spawn_slots then
				Managers.data_service.social:fetch_party_members():next(callback(self, "_setup_spawn_slots"))
			end
		end

		self[event_name_ogryn] = function (self, spawn_unit)
			self._ogryn_spawn_point_units[i] = spawn_unit

			self:_unregister_event(event_name_ogryn)

			if table.size(self._human_spawn_point_units) == max_spawn_slots and table.size(self._ogryn_spawn_point_units) == max_spawn_slots then
				Managers.data_service.social:fetch_party_members():next(callback(self, "_setup_spawn_slots"))
			end
		end

		self:_register_event(event_name_human)
		self:_register_event(event_name_ogryn)
	end

	local world_name = EndViewSettings.world_name
	local world_layer = EndViewSettings.world_layer
	local world_timer_name = EndViewSettings.timer_name
	self._world_spawner = UIWorldSpawner:new(world_name, world_layer, world_timer_name, self.view_name)
	local level_name = EndViewSettings.level_name

	self._world_spawner:spawn_level(level_name)
	self:_register_event("end_of_round_blur_background_world", "_end_of_round_blur_background_world")
end

EndView.event_register_end_of_round_camera = function (self, camera_unit)
	self:_unregister_event("end_of_round_camera")

	if self._context then
		self._context.camera_unit = camera_unit
	end

	local viewport_name = EndViewSettings.viewport_name
	local viewport_type = EndViewSettings.viewport_type
	local viewport_layer = EndViewSettings.viewport_layer
	local shading_environment = EndViewSettings.shading_environment

	self._world_spawner:create_viewport(camera_unit, viewport_name, viewport_type, viewport_layer, shading_environment)
end

EndView._setup_spawn_slots = function (self, players)
	local world = self._world_spawner:world()
	local camera = self._world_spawner:camera()
	local unit_spawner = self._world_spawner:unit_spawner()
	local ignored_slots = EndViewSettings.ignored_slots
	local player_index = 0
	local spawn_slots = {}
	local is_own_party = false
	local is_other_party = false

	for unique_id, player_info in pairs(players) do
		local party_status = player_info:party_status()

		if party_status == PartyStatus.mine then
			is_own_party = true
		elseif party_status == PartyStatus.other then
			is_other_party = true
		end
	end

	local more_than_one_party = is_own_party and is_other_party

	for unique_id, player_info in pairs(players) do
		player_index = player_index + 1
		local profile_spawner = UIProfileSpawner:new("EndView_" .. player_index, world, camera, unit_spawner)

		for j = 1, #ignored_slots do
			local slot_name = ignored_slots[j]

			profile_spawner:ignore_slot(slot_name)
		end

		local spawn_slot = {
			occupied = false,
			index = player_index,
			profile_spawner = profile_spawner,
			ogryn_spawn_point_unit = self._ogryn_spawn_point_units[player_index],
			human_spawn_point_unit = self._human_spawn_point_units[player_index]
		}
		spawn_slots[player_index] = spawn_slot

		self:_assign_player_to_slot(player_info, spawn_slot, more_than_one_party)
	end

	self._spawn_slots = spawn_slots
end

EndView._get_free_slot_id = function (self)
	local spawn_slots = self._spawn_slots

	for i = 1, #spawn_slots do
		local slot = spawn_slots[i]

		if not slot.occupied then
			return i
		end
	end
end

EndView._player_slot_id = function (self, account_id)
	local spawn_slots = self._spawn_slots

	for i = 1, #spawn_slots do
		local slot = spawn_slots[i]

		if slot.occupied and slot.account_id == account_id then
			return i
		end
	end
end

EndView._assign_player_to_slot = function (self, player_info, slot, more_than_one_party)
	local account_id = player_info:account_id()
	local profile = player_info:profile()

	if not profile then
		Log.warning("EndView", "Cannot show player model for %s, %s in EoR; no valid profile.", player_info:character_name(), tostring(account_id))

		return
	end

	local preview_profile = table.clone_instance(profile)
	local loadout = preview_profile.loadout
	local item_state_machine, item_animation_event, item_wield_slot = nil
	local end_of_round_pose_item = loadout.slot_animation_end_of_round

	if end_of_round_pose_item then
		item_state_machine = end_of_round_pose_item.state_machine
		item_animation_event = end_of_round_pose_item.animation_event
		local prop_item_key = end_of_round_pose_item.prop_item
		local prop_item = prop_item_key and prop_item_key ~= "" and MasterItems.get_item(prop_item_key)

		if prop_item then
			local prop_item_slot = prop_item.slots[1]
			loadout[prop_item_slot] = prop_item
			item_wield_slot = prop_item_slot
		end
	end

	local archetype_settings = preview_profile.archetype
	local breed_name = archetype_settings.breed
	local spawn_point_unit = nil

	if breed_name == "ogryn" then
		spawn_point_unit = slot.ogryn_spawn_point_unit
	else
		spawn_point_unit = slot.human_spawn_point_unit
	end

	local spawn_position = Unit.world_position(spawn_point_unit, 1)
	local spawn_rotation = Unit.world_rotation(spawn_point_unit, 1)
	slot.boxed_position = Vector3Box(spawn_position)
	slot.boxed_rotation = QuaternionBox(spawn_rotation)
	local profile_spawner = slot.profile_spawner

	profile_spawner:spawn_profile(preview_profile, spawn_position, spawn_rotation, item_state_machine, item_animation_event)

	if item_wield_slot then
		profile_spawner:wield_slot(item_wield_slot)
	end

	slot.occupied = true
	slot.player_info = player_info
	slot.account_id = account_id
	slot.widget = self:_create_player_widget(player_info, slot, more_than_one_party)
end

EndView._create_player_widget = function (self, player_info, slot, more_than_one_party)
	local widget_definition = self._player_widget_definition
	local widget_name = string.format("player_panel_%d", slot.index)
	local widget = self:_create_widget(widget_name, widget_definition)
	local widget_content = widget.content
	local profile = player_info:profile()
	widget_content.player_info = player_info
	widget_content.boxed_position = slot.boxed_position
	widget_content.character_name = TextUtilities.formatted_character_name(player_info)
	widget_content.character_title = ProfileUtils.character_title(profile)
	widget_content.account_name = player_info:user_display_name()
	local party_status = player_info:party_status()

	if more_than_one_party then
		if party_status == PartyStatus.mine then
			widget_content.party_status = "1"
		elseif party_status == PartyStatus.other then
			widget_content.party_status = "2"
		end
	end

	local widget_style = widget.style
	widget_style.party_status.visible = party_status == PartyStatus.mine or party_status == PartyStatus.other

	if player_info:is_own_player() then
		local character_name_style = widget_style.character_name
		character_name_style.text_color = character_name_style.own_player_text_color
	end

	local portrait_material_values = widget_style.character_portrait.material_values
	portrait_material_values.use_placeholder_texture = 1

	self:_load_portrait_icon(widget, profile)

	local widget_index = #self._game_mode_condition_widgets + 1
	self._game_mode_condition_widgets[widget_index] = widget

	return widget
end

EndView._end_of_round_blur_background_world = function (self, blur_amount)
	self._world_spawner:set_camera_blur(blur_amount, EndViewSettings.total_blur_duration)
end

EndView._update_player_slots = function (self, dt, t, input_service)
	local spawn_slots = self._spawn_slots

	if spawn_slots then
		for i = 1, #spawn_slots do
			local slot = spawn_slots[i]

			if slot.occupied then
				local profile_spawner = slot.profile_spawner

				profile_spawner:update(dt, t, input_service)
			end
		end
	end
end

EndView._reset_spawn_slot = function (self, slot)
	local profile_spawner = slot.profile_spawner

	if profile_spawner then
		profile_spawner:destroy()
	end

	slot.account_id = nil
	slot.profile_spawner = nil
	slot.player = nil
end

EndView._set_mission_key = function (self, mission_key, session_report)
	local mission_settings = Missions[mission_key]
	local display_name = mission_settings.mission_name
	local widget = self._widgets_by_name.title_text
	local widget_content = widget.content
	widget_content.mission_header = self:_localize(display_name)
	local team_session_report = session_report and session_report.team

	if self._round_won and team_session_report then
		local mission_time_in_sec = team_session_report.play_time_seconds
		local text_params = {
			total_kills = team_session_report.total_kills,
			total_deaths = team_session_report.total_deaths,
			mission_time = TextUtilities.format_time_span_long_form_localized(mission_time_in_sec)
		}
		widget_content.mission_sub_header = Localize("loc_end_view_mission_sub_header_victory", true, text_params)
	end
end

EndView._load_portrait_icon = function (self, widget, profile)
	if not profile then
		return
	end

	local widget_content = widget.content
	local portrait_load_id = widget_content.portrait_load_id

	if portrait_load_id then
		self:_unload_widget_portrait(widget)
	end

	local profile_icon_loaded_callback = callback(self, "_cb_set_player_icon", widget)
	widget_content.awaiting_portrait_callback = true
	widget_content.portrait_load_id = Managers.ui:load_profile_portrait(profile, profile_icon_loaded_callback)
	widget_content.portrait_character_id = profile.character_id
	local loadout = profile.loadout
	local frame_item = loadout and loadout.slot_portrait_frame
	local frame_id = frame_item and frame_item.gear_id
	widget_content.frame_id = frame_id

	if frame_item then
		local cb = callback(self, "_cb_set_player_frame", widget)
		widget_content.frame_load_id = Managers.ui:load_item_icon(frame_item, cb)
	else
		widget_content.frame_load_id = nil
	end

	local insignia_item = loadout and loadout.slot_insignia or MasterItems.find_fallback_item("slot_insignia")
	local insignia_id = insignia_item and insignia_item.name
	widget_content.insignia_id = insignia_id
	local cb = callback(self, "_cb_set_player_insignia", widget)
	widget_content.insignia_load_id = Managers.ui:load_item_icon(insignia_item, cb)
end

EndView._unload_portrait_icon = function (self, widget, ui_renderer)
	UIWidget.set_visible(widget, ui_renderer, false)
	UIWidget.set_visible(widget, ui_renderer, true)

	local widget_content = widget.content
	local portrait_style = widget.style.character_portrait

	if widget_content.insignia_id then
		self:_unload_insignia(widget)
	end

	if widget_content.frame_load_id then
		self:_unload_portrait_frame(widget)
	end

	local portrait_load_id = widget_content.portrait_load_id

	if not portrait_load_id then
		return
	end

	local material_values = portrait_style.material_values
	material_values.use_placeholder_texture = 1

	Managers.ui:unload_profile_portrait(portrait_load_id)

	widget_content.portrait_load_id = nil
end

EndView._unload_portrait_frame = function (self, widget, ui_renderer)
	local frame_style = widget.style.character_portrait
	local material_values = frame_style.material_values
	local portrait_frame_texture = material_values.portrait_frame_texture
	material_values.portrait_frame_texture = UISettings.portrait_frame_default_texture

	Log.info("EndView", "Destroying frame: %s", portrait_frame_texture)

	local widget_content = widget.content

	Managers.ui:unload_item_icon(widget_content.frame_load_id)

	widget_content.frame_load_id = nil
end

EndView._unload_insignia = function (self, widget)
	local insignia_style = widget.style.character_insignia
	local material_values = insignia_style.material_values
	local character_insignia_texture = material_values.texture_map
	material_values.texture_map = UISettings.insignia_default_texture

	Log.info("EndView", "Destroying insignia: %s", character_insignia_texture)

	local widget_content = widget.content

	Managers.ui:unload_item_icon(widget_content.insignia_load_id)

	widget_content.insignia_load_id = nil
end

EndView._cb_set_player_icon = function (self, widget, grid_index, rows, columns)
	local portrait_style = widget.style.character_portrait
	local material_values = portrait_style.material_values
	material_values.use_placeholder_texture = 0
	material_values.rows = rows
	material_values.columns = columns
	material_values.grid_index = grid_index - 1
end

EndView._cb_set_player_frame = function (self, widget, item)
	local portrait_style = widget.style.character_portrait
	portrait_style.material_values.portrait_frame_texture = item.icon
end

EndView._cb_set_player_insignia = function (self, widget, item)
	local portrait_style = widget.style.character_insignia
	portrait_style.material_values.texture_map = item.icon
end

return EndView