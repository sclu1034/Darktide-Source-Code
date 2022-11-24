local DialogueBreedSettings = require("scripts/settings/dialogue/dialogue_breed_settings")
local DialogueSettings = require("scripts/settings/dialogue/dialogue_settings")
local PlayerVoiceGrunts = require("scripts/utilities/player_voice_grunts")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local VoiceFxPresetSettings = require("scripts/settings/dialogue/voice_fx_preset_settings")
local VOQueryConstants = require("scripts/settings/dialogue/vo_query_constants")
local Vo = {}
local _get_breed, _get_alive_players, _get_random_player, _get_random_vox_unit, _get_all_vox_voice_profiles, _get_closest_player_except, _get_random_non_threatening_player_unit, _can_player_trigger_vo, _get_mission_giver_unit, _log_vo_event = nil
local Interactions = {
	health_station = function (dialogue_extension)
		local event_data = dialogue_extension:get_event_data_payload()
		local event_name = "heal_start"

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
}

Vo.health_critical_event = function (unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "rapid_loosing_health"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.interaction_start_event = function (unit, target_unit, interaction_template_name)
	if ScriptUnit.has_extension(unit, "dialogue_context_system") then
		local vo_event = Interactions[interaction_template_name]

		if vo_event then
			local dialogue_extension = ScriptUnit.extension(unit, "dialogue_system")

			vo_event(dialogue_extension)
		end
	end

	if ScriptUnit.has_extension(target_unit, "dialogue_context_system") then
		local timeset = Managers.time:time("gameplay") + 900
		local dialogue_extension = ScriptUnit.extension(target_unit, "dialogue_system")

		dialogue_extension:store_in_memory("user_memory", "last_revivee", timeset)
		dialogue_extension:store_in_memory("user_memory", "revivee", 1)
	end
end

Vo.throwing_item_event = function (unit, projectile_template)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "throwing_item"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.item = projectile_template

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.out_of_ammo_event = function (inventory_slot_component, visual_loadout_extension)
	local shooter = visual_loadout_extension._player.player_unit
	local dialogue_extension = ScriptUnit.has_extension(shooter, "dialogue_system")
	local event_name = "reload_failed"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local ammo_reserve = inventory_slot_component.current_ammunition_reserve
		local clip_capacity = inventory_slot_component.max_ammunition_clip
		local current_clip_amount = inventory_slot_component.current_ammunition_clip
		local full_clip = clip_capacity == current_clip_amount
		local is_out_of_ammo = ammo_reserve == 0 and not full_clip

		if is_out_of_ammo then
			local event_data = dialogue_extension:get_event_data_payload()
			event_data.fail_reason = "out_of_ammo"

			dialogue_extension:trigger_dialogue_event(event_name, event_data)
		end
	end
end

Vo.ammo_hog_event = function (unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "ammo_hog"
	local timeset = Managers.time:time("gameplay") + 900

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()

		dialogue_extension:trigger_faction_dialogue_query(event_name, event_data, nil, dialogue_extension._faction_breed_name, true)
		dialogue_extension:store_in_memory("user_memory", "last_ammo_hogger", timeset)
		dialogue_extension:store_in_memory("user_memory", "ammo_hogger", 1)
	end
end

Vo.health_hog_event = function (unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "health_hog"
	local timeset = Managers.time:time("gameplay") + 900

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()

		dialogue_extension:trigger_faction_dialogue_query(event_name, event_data, nil, dialogue_extension._faction_breed_name, true)
		dialogue_extension:store_in_memory("user_memory", "last_health_hogger", timeset)
		dialogue_extension:store_in_memory("user_memory", "health_hogger", 1)
	end
end

Vo.head_shot_event = function (killer_unit, distance, damage_profile_name)
	local dialogue_extension = ScriptUnit.has_extension(killer_unit, "dialogue_system")
	local dialogue_context_extension = ScriptUnit.has_extension(killer_unit, "dialogue_context_system")

	if dialogue_extension == nil or dialogue_context_extension == nil then
		return
	elseif damage_profile_name == "psyker_smite_kill" then
		return
	end

	dialogue_context_extension:increase_timed_counter("number_of_headshots")

	local ranged_special_kill_threshold = DialogueSettings.ranged_special_kill_threshold

	if ranged_special_kill_threshold and ranged_special_kill_threshold < distance then
		local event_name = "head_shot"

		if _can_player_trigger_vo(dialogue_extension, event_name) then
			local event_data = dialogue_extension:get_event_data_payload()

			dialogue_extension:trigger_faction_dialogue_query(event_name, event_data, nil, dialogue_extension._faction_breed_name, true)
		end
	end
end

Vo.player_interaction_vo_event = function (interactor_unit, interactee_unit, interaction_vo_event)
	local interactor_ext = ScriptUnit.has_extension(interactor_unit, "dialogue_system")
	local interactee_ext = ScriptUnit.has_extension(interactee_unit, "dialogue_system")
	local query_concept = VOQueryConstants.concepts.interaction_vo

	if interactor_ext == nil or interactee_ext == nil or interaction_vo_event == nil then
		return
	end

	if query_concept and _can_player_trigger_vo(interactor_ext, query_concept) then
		local event_data = interactor_ext:get_event_data_payload()
		event_data.interactor_class = interactor_ext:vo_class_name()
		event_data.interactee_class = interactee_ext:vo_class_name()
		event_data.trigger_id = interaction_vo_event

		interactor_ext:trigger_dialogue_event(query_concept, event_data)

		if interactor_ext._vo_profile_name ~= interactee_ext._vo_profile_name then
			interactee_ext:set_is_disabled_override(true)
		end
	end
end

Vo.killstreak_event = function (killer_unit)
	local dialogue_extension = ScriptUnit.has_extension(killer_unit, "dialogue_system")
	local event_name = "killstreak"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local breed = _get_breed(killer_unit)
		local killer_source_name = breed and DialogueBreedSettings[breed.name].vo_class_name
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.killer_name = killer_source_name

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.player_damage_event = function (unit, damage)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "expression"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local sound_event_alias = damage < DialogueSettings.player_vce_light_damage_threshold and "hurt_light_vce" or "hurt_heavy_vce"
		local fx_extension = ScriptUnit.extension(unit, "fx_system")
		local visual_loadout_extension = ScriptUnit.extension(unit, "visual_loadout_system")

		PlayerVoiceGrunts.trigger_voice(sound_event_alias, visual_loadout_extension, fx_extension, false)
	end
end

Vo.player_land_event = function (unit, time_in_falling)
	if unit and DialogueSettings.heavy_land_on_air_threshold < time_in_falling then
		local fx_extension = ScriptUnit.extension(unit, "fx_system")
		local visual_loadout_extension = ScriptUnit.extension(unit, "visual_loadout_system")

		PlayerVoiceGrunts.trigger_voice("land_heavy_vce", visual_loadout_extension, fx_extension, false)
	end
end

Vo.pouncing_alert_event = function (target_unit, pouncing_breed)
	local dialogue_extension = ScriptUnit.has_extension(target_unit, "dialogue_system")

	if not dialogue_extension then
		return
	end

	local event_name = "pouncing_enemy"
	local pouncing_breed_name = pouncing_breed.name
	local event_data = dialogue_extension:get_event_data_payload()
	event_data.enemy_tag = pouncing_breed_name

	dialogue_extension:trigger_dialogue_event(event_name, event_data)
end

Vo.warning_event = function (target_unit, trigger_id)
	local dialogue_extension = ScriptUnit.has_extension(target_unit, "dialogue_system")
	local event_name = "warning"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.player_suppressed_event = function (unit)
	local context_extension = ScriptUnit.has_extension(unit, "dialogue_context_system")

	if context_extension then
		context_extension:increase_timed_counter("number_of_player_suppressions")
	end
end

Vo.timer_based_vo_event = function (unit, vo_event_data)
	local context_extension = ScriptUnit.has_extension(unit, "dialogue_context_system")

	if context_extension then
		context_extension:increase_timed_counter("number_of_npc_vo_triggers")
	end
end

Vo.armor_hit_event = function (unit)
	local context_extension = ScriptUnit.has_extension(unit, "dialogue_context_system")

	if context_extension then
		context_extension:increase_timed_counter("number_of_armor_hits")
	end
end

Vo.friendly_fire_counter_event = function (attacking_unit, attacked_unit)
	local context_extension = ScriptUnit.has_extension(attacked_unit, "dialogue_context_system")

	if context_extension then
		context_extension:increase_timed_counter("friendly_fire_hits")

		local friendly_fire_hits = context_extension:get_timed_counter("friendly_fire_hits")
		local friendly_fire_hits_count = friendly_fire_hits.count

		if friendly_fire_hits_count == DialogueSettings.friendly_fire_bullet_counter then
			Vo.friendly_fire_event(attacking_unit, attacked_unit)
		end
	end
end

Vo.friendly_fire_event = function (attacking_unit, attacked_unit)
	if attacking_unit and attacked_unit and ScriptUnit.has_extension(attacking_unit, "dialogue_context_system") and ScriptUnit.has_extension(attacked_unit, "dialogue_context_system") then
		local dialogue_ext_attacking_unit = ScriptUnit.extension(attacking_unit, "dialogue_system")
		local event_data = dialogue_ext_attacking_unit:get_event_data_payload()
		event_data.attacking_class = dialogue_ext_attacking_unit:vo_class_name()
		local dialogue_ext_attacked_unit = ScriptUnit.extension(attacked_unit, "dialogue_system")
		event_data.attacked_class = dialogue_ext_attacked_unit:vo_class_name()
		local event_name = "friendly_fire"
		local timeset = Managers.time:time("gameplay") + 900

		if _can_player_trigger_vo(dialogue_ext_attacked_unit, event_name) then
			dialogue_ext_attacked_unit:trigger_dialogue_event(event_name, event_data)
			dialogue_ext_attacking_unit:store_in_memory("user_memory", "last_shot_friend", timeset)
			dialogue_ext_attacking_unit:store_in_memory("user_memory", "has_friendly_fired", 1)
		end
	end
end

Vo.player_ledge_hanging_event = function (unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local vo_concept = "ledge_hanging"

	if _can_player_trigger_vo(dialogue_extension, vo_concept) then
		local event_data = dialogue_extension:get_event_data_payload()

		dialogue_extension:trigger_dialogue_event(vo_concept, event_data)
	end
end

Vo.enemy_kill_event = function (killer_unit, killed_unit)
	if killer_unit then
		local killer_dialogue_extension = ScriptUnit.has_extension(killer_unit, "dialogue_system")
		local player_unit_spawn_manager = Managers.state.player_unit_spawn
		local player = player_unit_spawn_manager:owner(killer_unit)

		if killer_dialogue_extension and player ~= nil then
			if ScriptUnit.has_extension(killer_unit, "dialogue_context_system") then
				local context_extension = ScriptUnit.extension(killer_unit, "dialogue_context_system")

				context_extension:increase_timed_counter("number_of_kills")
			end

			local breed_data = _get_breed(killed_unit)

			if DialogueBreedSettings[breed_data.name].vo_triggers_enemy_kill_query then
				local killed_unit_name = "UNKNOWN"

				if breed_data then
					if breed_data.tags.monster then
						killed_unit_name = "monster"
					else
						killed_unit_name = breed_data.name
					end
				elseif ScriptUnit.has_extension(killed_unit, "dialogue_system") then
					killed_unit_name = ScriptUnit.extension(killed_unit, "dialogue_system"):get_context().player_profile
				end

				local event_name = "enemy_kill"

				if _can_player_trigger_vo(killer_dialogue_extension, event_name) then
					local event_data = killer_dialogue_extension:get_event_data_payload()
					event_data.killed_type = killed_unit_name

					killer_dialogue_extension:trigger_dialogue_event(event_name, event_data)
				end
			end
		end
	end
end

Vo.player_vo_enemy_attack_event = function (unit, breed_name, vo_event)
	local random_player = _get_random_player()

	if random_player then
		local dialogue_extension = ScriptUnit.has_extension(random_player, "dialogue_system")
		local concept = "player_enemy_attack"

		if _can_player_trigger_vo(dialogue_extension, concept) then
			local event_data = dialogue_extension:get_event_data_payload()
			event_data.enemy_tag = breed_name
			event_data.vo_event = vo_event

			dialogue_extension:trigger_faction_dialogue_query(concept, event_data, nil, "imperium", true)
		end
	end
end

Vo.closest_player_except_vo_enemy_attack_event = function (unit, breed_name, vo_event, position, filtered_player_unit)
	local best_player = _get_closest_player_except(position, filtered_player_unit)

	if best_player then
		local dialogue_extension = ScriptUnit.has_extension(best_player, "dialogue_system")
		local concept = "player_enemy_attack"

		if _can_player_trigger_vo(dialogue_extension, concept) then
			local event_data = dialogue_extension:get_event_data_payload()
			event_data.enemy_tag = breed_name
			event_data.vo_event = vo_event

			dialogue_extension:trigger_dialogue_event(concept, event_data)
		end
	end
end

Vo.player_vo_event_by_concept = function (vo_concept)
	local random_player = _get_random_player()

	if random_player then
		local dialogue_extension = ScriptUnit.has_extension(random_player, "dialogue_system")
		local concept = vo_concept

		if _can_player_trigger_vo(dialogue_extension, concept) then
			local event_data = dialogue_extension:get_event_data_payload()

			dialogue_extension:trigger_dialogue_event(concept, event_data)
		end
	end
end

Vo.monster_health_critical_event = function (unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "enemy_near_death_monster"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.monster_combat_conversation = function (unit, breed_name)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "combat_story_talk"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.story_type = breed_name

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.player_guidance_wrong_way_event = function (unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "guidance_wrong_way"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.play_expression_relief_vo = function ()
	local random_player = _get_random_player()
	local dialogue_extension = ScriptUnit.has_extension(random_player, "dialogue_system")
	local event_name = "expression"

	if random_player ~= nil and _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.expression_type = "expression_relief"

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_shooting_from_covers_event = function ()
	local random_player = _get_random_player()
	local dialogue_extension = ScriptUnit.has_extension(random_player, "dialogue_system")
	local event_name = "seen_enemy_group_far_range_shooting_behind_cover"

	if random_player ~= nil and _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.player_death_event = function (dead_player_unit)
	local dead_player_dialogue_ext = ScriptUnit.has_extension(dead_player_unit, "dialogue_system")

	if dead_player_dialogue_ext then
		dead_player_dialogue_ext:stop_currently_playing_vo()
	end

	local player_position = Unit.local_position(dead_player_unit, 1)
	local closest_player = _get_closest_player_except(player_position, dead_player_unit)
	local closest_player_dialogue_ext = ScriptUnit.has_extension(closest_player, "dialogue_system")
	local event_name = "player_death"

	if closest_player and _can_player_trigger_vo(closest_player_dialogue_ext, event_name) then
		local event_data = closest_player_dialogue_ext:get_event_data_payload()
		event_data.died_class = dead_player_dialogue_ext:vo_class_name()

		closest_player_dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.play_combat_ability_event = function (unit, vo_tag)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "combat_ability"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.ability_name = vo_tag

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.heard_horde = function (unit, horde_type)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local vo_concept = "heard_horde"

	if _can_player_trigger_vo(dialogue_extension, vo_concept) then
		local event_data = dialogue_extension:get_event_data_payload()

		if horde_type == "ambush_horde" then
			event_data.horde_type = "ambush"
		else
			event_data.horde_type = "vector"
		end

		dialogue_extension:trigger_dialogue_event(vo_concept, event_data)
	end
end

Vo.look_at_event = function (dialogue_extension, tag, distance, target_unit)
	local event_name = "look_at"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		local observer_vo_class = dialogue_extension:vo_class_name()
		local observer_vo_profile = dialogue_extension:get_voice_profile()
		event_data.look_at_tag = tag
		event_data.distance = distance
		event_data.observer_vo_class = observer_vo_class
		event_data.observer_vo_profile = observer_vo_profile

		dialogue_extension:trigger_dialogue_event(event_name, event_data)

		local target_ext = ScriptUnit.has_extension(target_unit, "dialogue_system")

		if target_ext then
			local timeset = Managers.time:time("gameplay") + 900

			target_ext:store_in_memory("user_memory", "has_been_seen", 1)
			target_ext:store_in_memory("user_memory", "has_been_seen_time", timeset)
		end
	end
end

Vo.faction_look_at_event = function (dialogue_extension, faction_event, faction_name, tag, distance)
	local event_data = dialogue_extension:get_event_data_payload()
	local observer_vo_class = dialogue_extension:vo_class_name()
	local observer_vo_profile = dialogue_extension:get_voice_profile()
	event_data.look_at_tag = tag
	event_data.distance = distance
	event_data.observer_vo_class = observer_vo_class
	event_data.observer_vo_profile = observer_vo_profile

	dialogue_extension:trigger_faction_dialogue_query(faction_event, event_data, nil, faction_name, true)
end

Vo.distance_based_event = function (dialogue_extension, proximity_type, event_data)
	local event_name = proximity_type

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.seen_enemy_event = function (unit, enemy_tag, enemy_unit, distance)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "seen_enemy"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.enemy_tag = enemy_tag
		event_data.enemy_unit = enemy_unit
		event_data.distance = distance

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.heard_enemy_event = function (unit, enemy_tag, enemy_unit, distance)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "heard_enemy"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.enemy_tag = enemy_tag
		event_data.enemy_unit = enemy_unit
		event_data.distance = distance

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.generic_mission_vo_event = function (unit, trigger_id)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "generic_mission_vo"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.environmental_story_vo_event = function (unit, story_name)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "environmental_story"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.story_name = story_name

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.player_enemy_alert_event = function (unit, breed_name, vo_event)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local concept = "player_enemy_alert"

	if _can_player_trigger_vo(dialogue_extension, concept) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.enemy_tag = breed_name
		event_data.vo_event = vo_event

		dialogue_extension:trigger_dialogue_event(concept, event_data)
	end
end

Vo.player_pounced_by_special_event = function (unit, breed_name)
	local dialogue_extension = ScriptUnit.extension(unit, "dialogue_system")
	local concept_name = "pounced_by_special_attack"

	if _can_player_trigger_vo(dialogue_extension, concept_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.enemy_tag = breed_name

		dialogue_extension:trigger_dialogue_event(concept_name, event_data)
	end
end

Vo.knocked_down_multiple_times_event = function (downed_unit)
	if ScriptUnit.has_extension(downed_unit, "dialogue_context_system") then
		local context_extension = ScriptUnit.extension(downed_unit, "dialogue_context_system")

		context_extension:increase_timed_counter("number_of_knocked_downs")
	end
end

Vo.player_knocked_down_multiple_times_event = function (downed_unit)
	local dialogue_extension = ScriptUnit.has_extension(downed_unit, "dialogue_system")
	local vo_concept = "knocked_down_multiple_times"

	if _can_player_trigger_vo(dialogue_extension, vo_concept) then
		local query_data = dialogue_extension:get_event_data_payload()
		query_data.player_class = dialogue_extension:vo_class_name()

		dialogue_extension:trigger_faction_dialogue_query(vo_concept, query_data, nil, dialogue_extension._faction_breed_name, true)
	end
end

Vo.player_catapulted_event = function (unit)
	if unit then
		local fx_extension = ScriptUnit.extension(unit, "fx_system")
		local visual_loadout_extension = ScriptUnit.extension(unit, "visual_loadout_system")

		PlayerVoiceGrunts.trigger_voice("catapulted_vce", visual_loadout_extension, fx_extension, true)
	end
end

Vo.player_catapulted_land_event = function (unit)
	if unit then
		local fx_extension = ScriptUnit.extension(unit, "fx_system")
		local visual_loadout_extension = ScriptUnit.extension(unit, "visual_loadout_system")

		PlayerVoiceGrunts.trigger_voice("catapulted_land_vce", visual_loadout_extension, fx_extension, true)
	end
end

Vo.enemy_assault_event = function (unit)
	local breed = _get_breed(unit)
	local assault_vo_event_name = DialogueBreedSettings[breed.name].assault_vo_event
	local dialogue_ext = ScriptUnit.has_extension(unit, "dialogue_system")

	if assault_vo_event_name and dialogue_ext then
		local event_data = dialogue_ext:get_event_data_payload()
		local event_name = assault_vo_event_name

		dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_take_position_event = function (unit)
	local dialogue_ext = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_ext then
		local event_data = dialogue_ext:get_event_data_payload()
		local event_name = "take_position"

		dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_alerted_idle_event = function (unit, breed_name)
	local dialogue_ext = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_ext then
		local event_data = dialogue_ext:get_event_data_payload()
		local event_name = "alerted_idle"
		event_data.enemy_tag = breed_name

		dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.random_player_enemy_alert_event = function (enemy_unit, enemy_breed, vo_event, optional_non_threatening_player)
	local player_unit = nil

	if optional_non_threatening_player then
		player_unit = _get_random_non_threatening_player_unit(enemy_unit)
	else
		player_unit = _get_random_player()
	end

	if player_unit then
		Vo.player_enemy_alert_event(player_unit, enemy_breed.name, vo_event)
	end
end

Vo.enemy_ranged_idle_event = function (unit)
	local dialogue_ext = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_ext then
		local event_data = dialogue_ext:get_event_data_payload()
		local event_name = "ranged_idle"

		dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_take_cover_event = function (unit)
	local dialogue_ext = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_ext then
		local event_data = dialogue_ext:get_event_data_payload()
		local event_name = "take_cover"

		dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_call_backup_event = function (unit)
	local dialogue_ext = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_ext then
		local event_data = dialogue_ext:get_event_data_payload()
		local event_name = "call_backup"

		dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_spawn_vo_event = function (unit, spawn_event_name)
	local dialogue_ext = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_ext then
		local event_data = dialogue_ext:get_event_data_payload()
		local event_name = spawn_event_name

		dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_skulk_event = function (unit)
	local dialogue_ext = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_ext then
		local event_data = dialogue_ext:get_event_data_payload()
		local event_name = "skulking"

		dialogue_ext:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_vo_event = function (unit, event_name)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local event_data = dialogue_extension:get_event_data_payload()

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_generic_vo_event = function (unit, trigger_id, breed_name_or_nil)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local event_name = "generic_enemy_vo_event"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		if breed_name_or_nil then
			event_data.enemy_tag = breed_name_or_nil
		end

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.enemy_vo_special_attack_event = function (unit, event_type)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local event_name = "enemy_special_attack"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.attack_name = event_type

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.mission_giver_event = function (unit, concept)
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_table = dialogue_input:get_event_data_payload()

	dialogue_input:trigger_dialogue_event(concept, event_table)
end

Vo.mission_giver_mission_brief_event = function (unit, mission_brief_starter_line)
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_name = "mission_brief"
	local event_table = dialogue_input:get_event_data_payload()
	event_table.starter_line = mission_brief_starter_line

	dialogue_input:trigger_dialogue_event(event_name, event_table)
end

Vo.mission_giver_mission_info = function (unit, trigger_id)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local event_name = "mission_info"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.mission_giver_mission_info_vo = function (voice_selection, selected_voice, trigger_id)
	local is_server = Managers.state.game_session:is_server()

	if not is_server then
		-- Nothing
	end

	local voice_over_spawn_manager = Managers.state.voice_over_spawn
	local misison_giver_unit = nil

	if voice_selection == "rule_based" then
		misison_giver_unit = _get_random_vox_unit()
	elseif voice_selection == "mission_default" then
		local voice_profile = voice_over_spawn_manager:current_voice_profile()
		misison_giver_unit = voice_over_spawn_manager:voice_over_unit(voice_profile)
	elseif voice_selection == "selected_voice" then
		misison_giver_unit = voice_over_spawn_manager:voice_over_unit(selected_voice)
	end

	local dialogue_extension = ScriptUnit.has_extension(misison_giver_unit, "dialogue_system")

	if dialogue_extension then
		local event_name = "mission_info"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.mission_giver_point_of_interest_vo = function (dialogue_target_filter, look_at_tag, mission_giver_selected_voice, distance)
	local is_server = Managers.state.game_session:is_server()

	if not is_server then
		-- Nothing
	end

	local voice_over_spawn_manager = Managers.state.voice_over_spawn
	local misison_giver_unit = nil

	if dialogue_target_filter == "mission_giver_mission_default" then
		local voice_profile = voice_over_spawn_manager:current_voice_profile()
		misison_giver_unit = voice_over_spawn_manager:voice_over_unit(voice_profile)
	elseif dialogue_target_filter == "mission_giver_selected_voice" then
		misison_giver_unit = voice_over_spawn_manager:voice_over_unit(mission_giver_selected_voice)
	end

	local dialogue_extension = ScriptUnit.has_extension(misison_giver_unit, "dialogue_system")

	if dialogue_extension then
		local event_name = "look_at"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.distance = distance
		event_data.look_at_tag = look_at_tag

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.mission_giver_vo_event = function (voice_profile, concept, trigger_id)
	local unit = _get_mission_giver_unit(voice_profile)

	if unit then
		local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
		local event_name = concept
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		if dialogue_extension then
			dialogue_extension:trigger_dialogue_event(event_name, event_data)
		end
	end
end

Vo.confessional_vo_event = function (unit, category)
	if unit then
		local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
		local event_name = "confessional_vo"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.category = category

		if dialogue_extension then
			dialogue_extension:trigger_dialogue_event(event_name, event_data)
		end
	end
end

Vo.play_npc_interacting_vo_event = function (unit, interactor_unit, vo_event, cooldown_time, play_in)
	local is_server = Managers.state.game_session:is_server()

	if not is_server then
		-- Nothing
	end

	local dialogue_ext_npc = ScriptUnit.has_extension(unit, "dialogue_system")
	local dialogue_ext_interactor = ScriptUnit.has_extension(interactor_unit, "dialogue_system")

	if dialogue_ext_npc and dialogue_ext_interactor then
		local interactor_voice_profile = dialogue_ext_interactor:get_voice_profile()
		local event_name = "npc_interacting_vo"
		local event_data = dialogue_ext_npc:get_event_data_payload()
		event_data.vo_event = vo_event
		event_data.interactor_voice_profile = interactor_voice_profile
		local player_level = _get_player_level(interactor_unit)
		event_data.player_level_string = tostring(player_level)

		if cooldown_time then
			event_data.cooldown_time = cooldown_time
		end

		if play_in == "interactor_only" then
			dialogue_ext_npc:trigger_targeted_dialogue_event(event_name, event_data, interactor_unit)
		else
			dialogue_ext_npc:trigger_dialogue_event(event_name, event_data)
		end
	end
end

Vo.play_npc_vo_event = function (unit, vo_event)
	local dialogue_ext_npc = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_ext_npc then
		local event_name = "npc_vo"
		local event_data = dialogue_ext_npc:get_event_data_payload()
		event_data.vo_event = vo_event

		dialogue_ext_npc:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.mission_giver_conversation_starter = function (unit, trigger_id)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local event_name = "mission_giver_conversation_starter"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.play_npc_story = function (trigger_id)
	local vox_unit = _get_random_vox_unit()

	if vox_unit then
		local dialogue_extension = ScriptUnit.has_extension(vox_unit, "dialogue_system")
		local event_name = "npc_story_talk"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.play_voice_fx_preset_preview = function (world, voice_fx_preset, sound_event)
	local stop_sound_event = UISoundEvents.character_appearence_stop_voice_preview
	local voice_fx_preset_rtpc = VoiceFxPresetSettings[voice_fx_preset]
	local has_voice_fx_preset = voice_fx_preset ~= "voice_fx_rtpc_none"

	if voice_fx_preset_rtpc and has_voice_fx_preset then
		local voice_over_spawn_manager = Managers.state.voice_over_spawn
		local voice_profile = "voice_preview"
		local unit = voice_over_spawn_manager:voice_over_unit(voice_profile)
		local wwise_world = Managers.world:wwise_world(world)
		local source = WwiseWorld.make_auto_source(wwise_world, unit)

		WwiseWorld.set_source_parameter(wwise_world, source, "voice_fx_preset", voice_fx_preset_rtpc)
		WwiseWorld.trigger_resource_event(wwise_world, stop_sound_event, source)
		WwiseWorld.trigger_resource_event(wwise_world, sound_event, source)
	end
end

Vo.on_demand_vo_event = function (unit, concept, trigger_id, target_unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local event_data = dialogue_extension:get_event_data_payload()
		local event_name = concept

		if concept == VOQueryConstants.concepts.on_demand_com_wheel then
			event_data.trigger_id = trigger_id
		elseif concept == VOQueryConstants.concepts.on_demand_vo_tag_enemy then
			local target_extension = ScriptUnit.has_extension(target_unit, "dialogue_system")

			if target_extension then
				local dynamic_smart_tag = target_extension:get_dynamic_smart_tag()

				if dynamic_smart_tag then
					event_data.enemy_tag = dynamic_smart_tag
				else
					event_data.enemy_tag = trigger_id
				end
			else
				event_data.enemy_tag = trigger_id
			end
		elseif concept == VOQueryConstants.concepts.on_demand_vo_tag_item then
			event_data.item_tag = trigger_id
		end

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.start_banter_vo_event = function (unit, trigger_id)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local event_name = "start_banter"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = trigger_id

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.reinforcements = function (dialogue_extension_unit, dialogue_extension)
	local breed = _get_breed(dialogue_extension_unit)

	Vo.enemy_generic_vo_event(dialogue_extension_unit, "reinforcements", breed.name)
end

Vo.play_local_vo_events = function (dialogue_system, vo_rules, voice_profile, wwise_route_key, on_play_callback, seed, is_opinion_vo)
	local unit_extensions = dialogue_system._unit_extension_data
	local vo_unit = nil

	for _, unit_ext in pairs(unit_extensions) do
		if unit_ext._vo_profile_name == voice_profile then
			vo_unit = unit_ext._unit

			break
		end
	end

	if vo_unit then
		local dialogue_extension = ScriptUnit.has_extension(vo_unit, "dialogue_system")

		if dialogue_extension then
			if is_opinion_vo then
				local local_player = Managers.player:local_player(1)
				local local_player_unit = local_player.player_unit
				local player_ext = ScriptUnit.has_extension(local_player_unit, "dialogue_system")

				if player_ext then
					local player_voice_profile = player_ext:get_voice_profile()
					local npc_class = dialogue_extension._context.class_name
					local opinion_settings = DialogueBreedSettings[npc_class].opinion_settings
					local opinion = opinion_settings[player_voice_profile]
					local rule = vo_rules[1]
					rule = rule .. "_" .. opinion

					dialogue_extension:play_local_vo_event(rule, wwise_route_key, nil, seed)
				end
			else
				dialogue_extension:play_local_vo_events(vo_rules, wwise_route_key, on_play_callback, seed)
			end
		end

		return vo_unit
	else
		Log.warning("DialogueSystem", "Play Local VO event, no VO unit found for profile %s ", vo_unit)
	end
end

Vo.play_local_vo_event = function (unit, rule_name, wwise_route_key, seed, is_opinion_vo)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local local_player = Managers.player:local_player(1)
		local local_player_unit = local_player.player_unit
		local player_ext = ScriptUnit.has_extension(local_player_unit, "dialogue_system")

		if player_ext then
			local can_interact = _can_interact(dialogue_extension, local_player_unit)

			if not can_interact then
				return
			end
		end

		if is_opinion_vo then
			local player_voice_profile = player_ext:get_voice_profile()
			local npc_class = dialogue_extension._context.class_name
			local opinion_settings = DialogueBreedSettings[npc_class].opinion_settings
			local opinion = opinion_settings[player_voice_profile]
			rule_name = rule_name .. "_" .. opinion
		end

		dialogue_extension:play_local_vo_event(rule_name, wwise_route_key, nil, seed)
	end
end

Vo.evaluate_rules = function (dialogue_system, rules, voice_profile, seed)
	local unit_extensions = dialogue_system._unit_extension_data
	local vo_unit = nil

	for _, unit_ext in pairs(unit_extensions) do
		if unit_ext._vo_profile_name == voice_profile then
			vo_unit = unit_ext._unit

			break
		end
	end

	if vo_unit then
		local dialogue_extension = ScriptUnit.has_extension(vo_unit, "dialogue_system")

		if dialogue_extension then
			return dialogue_extension:evaluate_rules(rules, seed)
		end
	else
		Log.warning("DialogueSystem", "Play Local VO event, no VO unit found for profile %s ", vo_unit)
	end
end

Vo.set_story_ticker = function (params)
	DialogueSettings.story_ticker_enabled = params
	DialogueSettings.short_story_ticker_enabled = params
end

Vo.set_dynamic_smart_tag = function (unit, tag)
	local is_server = Managers.state.game_session:is_server()

	if is_server then
		local enemy_extension = ScriptUnit.has_extension(unit, "dialogue_system")

		if enemy_extension then
			enemy_extension:set_dynamic_smart_tag(tag)

			local unit_spawner_manager = Managers.state.unit_spawner
			local go_id = unit_spawner_manager:game_object_id(unit)

			Managers.state.game_session:send_rpc_clients("rpc_set_dynamic_smart_tag", go_id, tag)
		end
	end
end

Vo.mission_giver_check_event = function ()
	local voice_over_spawn_manager = Managers.state.voice_over_spawn
	local is_server = Managers.state.game_session:is_server()

	if is_server then
		local voice_profile = voice_over_spawn_manager:current_voice_profile()
		local level = Managers.state.mission:mission_level()

		Level.trigger_event(level, voice_profile .. "_selected")
	end
end

Vo.stop_currently_playing_vo = function (unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		dialogue_extension:stop_currently_playing_vo()
	end
end

Vo.cutscene_vo_event = function (unit, vo_line_id)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

	if dialogue_extension then
		local event_name = "cutscene_vo_line"
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.vo_line_id = vo_line_id

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

Vo.play_debug_vo_event = function (unit)
	local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")
	local event_name = "warning"

	if _can_player_trigger_vo(dialogue_extension, event_name) then
		local event_data = dialogue_extension:get_event_data_payload()
		event_data.trigger_id = "debug_vo"

		dialogue_extension:trigger_dialogue_event(event_name, event_data)
	end
end

function _get_breed(unit)
	local unit_data_ext = ScriptUnit.has_extension(unit, "unit_data_system")

	if unit_data_ext then
		return unit_data_ext:breed()
	else
		return nil
	end
end

function _get_alive_players()
	local is_server = Managers.state.game_session:is_server()

	if not is_server then
		return
	end

	local side_system = Managers.state.extension:system("side_system")
	local side_name = side_system:get_default_player_side_name()
	local side = side_system:get_side_from_name(side_name)
	local player_unit_spawn_manager = Managers.state.player_unit_spawn
	local alive_players = player_unit_spawn_manager:alive_players()

	for i = #alive_players, 1, -1 do
		local player = alive_players[i]

		if not side.units_lookup[player.player_unit] then
			table.remove(alive_players, i)
		end
	end

	return alive_players
end

function _get_random_player()
	local alive_players = _get_alive_players()

	if alive_players then
		local num_alive_players = #alive_players

		if num_alive_players > 0 then
			local random_index = math.random(1, num_alive_players)
			local random_player = alive_players[random_index]

			return random_player.player_unit
		end
	end
end

local valid_player_units = {}

function _get_closest_player_except(position, filtered_player_unit)
	local alive_players = _get_alive_players()

	if alive_players then
		local num_alive_players = #alive_players

		if num_alive_players > 0 then
			table.clear(valid_player_units)

			for i = 1, num_alive_players do
				local player_unit = alive_players[i].player_unit

				if player_unit ~= filtered_player_unit then
					valid_player_units[#valid_player_units + 1] = player_unit
				end
			end

			local num_valid_player_units = #valid_player_units

			if num_valid_player_units > 0 then
				local closest_distance = math.huge
				local best_player_unit = nil

				for i = 1, num_valid_player_units do
					local player_unit = valid_player_units[i]
					local player_position = POSITION_LOOKUP[player_unit]
					local distance = Vector3.distance(position, player_position)

					if distance < closest_distance then
						closest_distance = distance
						best_player_unit = player_unit
					end
				end

				return best_player_unit
			end
		end
	end
end

function _get_random_non_threatening_player_unit(minion_unit)
	local perception_extension = ScriptUnit.extension(minion_unit, "perception_system")

	table.clear(valid_player_units)

	local alive_players = _get_alive_players()
	local least_threat = math.huge
	local least_threatening_unit = nil
	local num_alive_players = #alive_players

	for i = 1, num_alive_players do
		local player_unit = alive_players[i].player_unit
		local threat = perception_extension:threat(player_unit)

		if threat and threat < least_threat then
			least_threat = threat
			least_threatening_unit = player_unit
		elseif threat == least_threat or not threat then
			valid_player_units[#valid_player_units + 1] = player_unit
		end
	end

	local num_valid_player_units = #valid_player_units

	if num_valid_player_units > 0 then
		return valid_player_units[math.random(1, num_valid_player_units)]
	else
		return least_threatening_unit
	end
end

function _get_random_vox_unit()
	local vox_voice_profiles = _get_all_vox_voice_profiles()
	local num_voice_profiles = #vox_voice_profiles
	local random_index = math.random(1, num_voice_profiles)
	local voice_profile = vox_voice_profiles[random_index]

	return _get_mission_giver_unit(voice_profile)
end

function _get_all_vox_voice_profiles()
	local npc_vo_classes = DialogueBreedSettings.voice_classes_npc
	local vox_voice_profiles = {}

	for i = 1, #npc_vo_classes do
		local vo_class = npc_vo_classes[i]
		local class_settings = DialogueBreedSettings[vo_class]
		local voice_profiles = class_settings.wwise_voices

		for _, voice_profile in pairs(voice_profiles) do
			table.insert(vox_voice_profiles, voice_profile)
		end
	end

	return vox_voice_profiles
end

function _get_mission_giver_unit(voice_profile)
	local voice_over_spawn_manager = Managers.state.voice_over_spawn
	local is_server = Managers.state.game_session:is_server()

	if is_server then
		local unit = voice_over_spawn_manager:voice_over_unit(voice_profile)

		return unit
	end
end

function _can_player_trigger_vo(dialogue_extension, concept_name)
	if not dialogue_extension then
		return false
	end

	local context_data = dialogue_extension._context

	if concept_name == "knocked_down" and context_data.is_knocked_down then
		return true
	elseif concept_name == "ledge_hanging" and context_data.is_ledge_hanging then
		return true
	elseif concept_name == "pounced_by_special_attack" and context_data.is_pounced_down then
		return true
	elseif concept_name == "pounced_by_special_attack" and context_data.is_netted then
		return true
	elseif concept_name == "friends_close" and context_data.is_hogtied then
		return true
	elseif context_data.is_disabled then
		return false
	end

	return true
end

function _get_player_level(unit)
	local player_unit_spawn_manager = Managers.state.player_unit_spawn
	local player = player_unit_spawn_manager:owner(unit)
	local profile = player:profile()
	local player_level = profile.current_level

	return player_level
end

function _can_interact(dialogue_ext_npc, player_unit)
	local player_level = _get_player_level(player_unit)
	local npc_context = dialogue_ext_npc:get_context()
	local level_req = _get_interaction_level_req(npc_context)

	if player_level < level_req then
		return false
	else
		return true
	end
end

function _get_interaction_level_req(npc_context)
	local class_name = npc_context.class_name
	local level_req = DialogueBreedSettings[class_name].level_requirement or 0

	return level_req
end

function _log_vo_event(event_category, breed_name, vo_event)
	Log.info("DialogueSystem", event_category .. " breed_name = %s, event= %s ", breed_name, vo_event)
end

return Vo