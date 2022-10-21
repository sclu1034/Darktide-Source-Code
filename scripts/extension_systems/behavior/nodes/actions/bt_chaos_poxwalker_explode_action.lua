require("scripts/extension_systems/behavior/nodes/bt_node")

local Blackboard = require("scripts/extension_systems/blackboard/utilities/blackboard")
local Explosion = require("scripts/utilities/attack/explosion")
local BtChaosPoxwalkerExplodeAction = class("BtChaosPoxwalkerExplodeAction", "BtNode")

BtChaosPoxwalkerExplodeAction.enter = function (self, unit, breed, blackboard, scratchpad, action_data, t)
	local explode_position_node = action_data.explode_position_node
	local position = Unit.world_position(unit, Unit.node(unit, explode_position_node))
	local spawn_component = blackboard.spawn
	local world = spawn_component.world
	local physics_world = spawn_component.physics_world
	local impact_normal = Vector3.up()
	local charge_level = 1
	local attack_type = nil
	local power_level = Managers.state.difficulty:get_minion_attack_power_level(breed)
	local explosion_template = action_data.explosion_template

	Explosion.create_explosion(world, physics_world, position, impact_normal, unit, explosion_template, power_level, charge_level, attack_type)
end

BtChaosPoxwalkerExplodeAction.init_values = function (self, blackboard)
	local death_component = Blackboard.write_component(blackboard, "death")

	death_component.attack_direction:store(0, 0, 0)

	death_component.hit_zone_name = ""
	death_component.is_dead = false
	death_component.hit_during_death = false
	death_component.damage_profile_name = ""
	death_component.herding_template_name = ""
	death_component.killing_damage_type = ""
	death_component.force_instant_ragdoll = false
	death_component.staggered_during_lunge = false
end

BtChaosPoxwalkerExplodeAction.run = function (self, unit, breed, blackboard, scratchpad, action_data, dt, t)
	return "done"
end

return BtChaosPoxwalkerExplodeAction