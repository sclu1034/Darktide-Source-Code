local BotSpawning = require("scripts/managers/bot/bot_spawning")
local MasterItems = require("scripts/backend/master_items")
local BotManagerTestify = {
	spawn_bot = function (_, bot_manager)
		local is_server = Managers.state.game_session:is_server()

		fassert(is_server, "[BotManagerTestify] only server can spawn bots!")
		BotSpawning.spawn_bot_character("darktide_seven_01")
	end
}

BotManagerTestify.wait_for_bot_synchronizer_ready = function (_, bot_manager)
	local package_synchronizer_host = Managers.package_synchronization:synchronizer_host()
	local peer_id = Network.peer_id()

	if not package_synchronizer_host:is_peer_synced(peer_id) then
		return Testify.RETRY
	end
end

BotManagerTestify.wait_for_master_items_data = function (_, bot_manager)
	if not MasterItems.has_data() then
		return Testify.RETRY
	end
end

return BotManagerTestify