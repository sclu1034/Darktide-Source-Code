local AttackIntensity = require("scripts/utilities/attack_intensity")
local AttackSettings = require("scripts/settings/damage/attack_settings")
local Breed = require("scripts/utilities/breed")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local DialogueSettings = require("scripts/settings/dialogue/dialogue_settings")
local Health = require("scripts/utilities/health")
local HudElementPlayerHealthSettings = require("scripts/ui/hud/elements/player_health/hud_element_player_health_settings")
local MinionDeath = require("scripts/utilities/minion_death")
local PlayerDeath = require("scripts/utilities/player_death")
local PlayerUnitStatus = require("scripts/utilities/attack/player_unit_status")
local Vo = require("scripts/utilities/vo")
local attack_results = AttackSettings.attack_results
local proc_events = BuffSettings.proc_events
local TOUGHNESS_BROKEN_ATTACK_INTENSITIES = {
	ranged = math.huge,
	elite_ranged = math.huge
}
local Damage = {}
local _trigger_player_hurt_vo = nil

Damage.deal_damage = function (unit, breed_or_nil, attacking_unit, attacking_unit_owner_unit, attack_result, attack_type, damage_profile, damage, permanent_damage, tougness_damage, hit_actor, attack_direction, hit_zone_name, herding_template_or_nil, is_critical_strike, damage_type, hit_world_position_or_nil, wounds_shape_or_nil)
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local toughness_extension = ScriptUnit.has_extension(unit, "toughness_system")
	local was_alive = health_extension:is_alive()
	local previous_health_percent = health_extension:current_health_percent()
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	local is_minion = Breed.is_minion(breed_or_nil)
	local is_player = Breed.is_player(breed_or_nil)
	local side_system = Managers.state.extension:system("side_system")
	local is_ally = side_system:is_ally(attacking_unit, unit)
	local boss_extension_or_nil = ScriptUnit.has_extension(unit, "boss_system")

	if not is_ally and boss_extension_or_nil then
		boss_extension_or_nil:start_timer()
	end

	if toughness_extension then
		toughness_extension:add_damage(tougness_damage, attack_result, hit_actor, damage_profile, attack_type, attack_direction, hit_world_position_or_nil)
	end

	if attack_result == attack_results.toughness_broken then
		if is_player and buff_extension then
			local param_table = buff_extension:request_proc_event_param_table()
			param_table.unit = unit
			param_table.melee_attack = attack_type == "melee"

			buff_extension:add_proc_event(proc_events.on_player_toughness_broken, param_table)
		end

		if is_player then
			AttackIntensity.add_intensity(unit, TOUGHNESS_BROKEN_ATTACK_INTENSITIES)
		end
	end

	if damage > 0 or permanent_damage > 0 then
		if attacking_unit_owner_unit then
			local attacker_buff_extension = ScriptUnit.has_extension(attacking_unit_owner_unit, "buff_system")
			local attacker_health_extension = ScriptUnit.has_extension(attacking_unit_owner_unit, "health_system")

			if attacker_buff_extension and attacker_health_extension then
				local stat_buffs = attacker_buff_extension:stat_buffs()
				local leech = stat_buffs.leech

				if leech > 0 then
					local health = health_extension:current_health()
					local damage_dealt = math.clamp(damage, 0, health)
					local heal = damage_dealt * leech

					if heal > 0 then
						Health.add(attacking_unit_owner_unit, heal, DamageSettings.heal_types.leech)
					end
				end
			end
		end

		health_extension:add_damage(damage, permanent_damage, hit_actor, damage_profile, attack_type, attack_direction, attacking_unit_owner_unit)

		if is_player and buff_extension then
			local param_table = buff_extension:request_proc_event_param_table()
			param_table.attacking_unit = attacking_unit
			param_table.damage_amount = damage
			param_table.attack_type = attack_type

			buff_extension:add_proc_event(proc_events.on_damage_taken, param_table)
		end
	end

	local absorbed_attack = damage == 0 and permanent_damage == 0
	local current_health_percent = health_extension:current_health_percent()

	if is_player and not is_ally then
		if not absorbed_attack then
			local is_critical = current_health_percent <= HudElementPlayerHealthSettings.critical_health_threshold

			if is_critical then
				Vo.health_critical_event(unit)
			else
				_trigger_player_hurt_vo(unit, damage)
			end

			Managers.state.pacing:add_damage_tension("damaged", damage, unit)
		else
			Managers.state.pacing:add_damage_tension("absorbed_damage", damage, unit)
		end
	end

	if is_minion and breed_or_nil and breed_or_nil.tags.monster and not is_ally then
		local breed_name = breed_or_nil.name

		if current_health_percent <= DialogueSettings.monster_near_death_health_percent_vo then
			Vo.enemy_generic_vo_event(unit, "monster_near_death_scream", breed_name)
		elseif current_health_percent <= DialogueSettings.monster_critical_health_percent_vo then
			Vo.monster_health_critical_event(attacking_unit_owner_unit)
		elseif current_health_percent <= DialogueSettings.monster_tough_to_kill_vo_health_percent then
			Vo.monster_combat_conversation(attacking_unit_owner_unit, breed_name)
		end
	end

	if health_extension:health_depleted() then
		local is_dying = true
		local blackboard = BLACKBOARDS[unit]

		if blackboard and is_minion then
			local death_component = blackboard.death
			is_dying = not death_component.hit_during_death
		end

		if is_minion and (was_alive or is_dying) then
			MinionDeath.die(unit, attacking_unit_owner_unit, attack_direction, hit_zone_name, damage_profile, attack_type, herding_template_or_nil, is_critical_strike, damage_type)
		elseif is_player then
			local unit_data_extension = ScriptUnit.has_extension(unit, "unit_data_system")
			local character_state_component = unit_data_extension:read_component("character_state")
			local ignores_knockdown = damage_profile.ignores_knockdown
			local is_knocked_down = PlayerUnitStatus.is_knocked_down(character_state_component)
			local num_wounds = health_extension:num_wounds()
			local should_die = ignores_knockdown or is_knocked_down or num_wounds <= 1

			if should_die then
				PlayerDeath.die(unit, nil, attacking_unit_owner_unit)

				local should_add_died_tension = ignores_knockdown or num_wounds <= 1

				if should_add_died_tension then
					Managers.state.pacing:add_tension_type("died", unit)
				end
			else
				PlayerDeath.knock_down(unit)
			end
		end
	end

	local wounds_template = damage_profile.wounds_template

	if is_minion and wounds_template and hit_world_position_or_nil then
		local wounds_extension = ScriptUnit.has_extension(unit, "wounds_system")

		if wounds_extension then
			local hit_actor_node_index = Actor.node(hit_actor)
			local percent_damage_dealt = math.max(previous_health_percent - current_health_percent, 0)

			wounds_extension:add_wounds(wounds_template, hit_world_position_or_nil, hit_actor_node_index, attack_result, percent_damage_dealt, damage_type, hit_zone_name, wounds_shape_or_nil)
		end
	end
end

function _trigger_player_hurt_vo(unit, damage)
	local unit_data_extension = ScriptUnit.extension(unit, "unit_data_system")
	local character_state_component = unit_data_extension:read_component("character_state")
	local is_disabled = PlayerUnitStatus.is_disabled(character_state_component)

	if not is_disabled then
		Vo.player_damage_event(unit, damage)
	end
end

return Damage