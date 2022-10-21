local LocalRequestJoinSessionState = class("LocalRequestJoinSessionState")

LocalRequestJoinSessionState.init = function (self, state_machine, shared_state)
	assert(type(shared_state.channel_id) == "number", "Channel ID required")
	assert(shared_state.engine_gamesession, "Game session required")
	assert(type(shared_state.timeout) == "number", "Numeric timeout required")

	self._shared_state = shared_state
	self._time = 0
end

LocalRequestJoinSessionState.enter = function (self)
	local shared_state = self._shared_state

	GameSession.join(shared_state.engine_gamesession, shared_state.channel_id)

	shared_state.has_joined_session = true

	RPC.rpc_request_join_game_session(shared_state.channel_id)
end

LocalRequestJoinSessionState.update = function (self, dt)
	local shared_state = self._shared_state
	self._time = self._time + dt

	if Network.channel_state(shared_state.channel_id) ~= "connected" then
		Log.info("LocalRequestJoinSessionState", "Lost game session")

		return "lost_session", {
			game_reason = "lost_session"
		}
	end

	if GameSession.in_session(shared_state.engine_gamesession) then
		return "in_session"
	end

	if shared_state.timeout < self._time then
		Log.info("LocalRequestJoinSessionState", "Timeout while waiting for in_session")

		return "timeout", {
			game_reason = "timeout"
		}
	end
end

return LocalRequestJoinSessionState