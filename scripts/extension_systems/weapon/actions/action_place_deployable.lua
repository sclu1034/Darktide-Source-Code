require("scripts/extension_systems/weapon/actions/action_place_base")

local ActionPlaceDeployable = class("ActionPlaceDeployable", "ActionPlaceBase")

ActionPlaceDeployable._place_unit = function (self, action_settings, position, rotation, placed_on_unit)
	local player_unit = self._player_unit
	local player_or_nil = Managers.state.player_unit_spawn:owner(player_unit)
	local deployable_settings = action_settings.deployable_settings
	local unit_template = deployable_settings.unit_template
	local side_system = Managers.state.extension:system("side_system")
	local side = side_system.side_by_unit[player_unit]
	local side_id = side.side_id
	local unit_name, material = nil
	local placed_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template, position, rotation, material, side_id, deployable_settings, placed_on_unit)

	Managers.event:trigger("on_pickup_placed", placed_unit)
	self:_register_stats_and_telemetry(unit_template, player_or_nil)
end

return ActionPlaceDeployable
