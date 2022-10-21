local RPCS = {
	"rpc_check_connected_reply"
}
local LocalAwaitHostConnectState = class("LocalAwaitHostConnectState")

LocalAwaitHostConnectState.init = function (self, state_machine, shared_state)
	assert(type(shared_state.event_delegate) == "table", "Event delegate required")
	assert(type(shared_state.channel_id) == "number", "Numeric channel id required")
	assert(type(shared_state.timeout) == "number", "Numeric timeout required")

	self._shared_state = shared_state
	self._time = 0
	self._got_reply = false

	shared_state.event_delegate:register_connection_channel_events(self, shared_state.channel_id, unpack(RPCS))

	shared_state.started_state_sync = true

	Managers.mechanism:connect_to_host(shared_state.channel_id)
	RPC.rpc_check_connected(shared_state.channel_id)
end

LocalAwaitHostConnectState.destroy = function (self)
	local shared_state = self._shared_state

	shared_state.event_delegate:unregister_channel_events(shared_state.channel_id, unpack(RPCS))
end

LocalAwaitHostConnectState.update = function (self, dt)
	local shared_state = self._shared_state
	self._time = self._time + dt
	local state, reason = Network.channel_state(shared_state.channel_id)

	if state == "disconnected" then
		Log.info("LocalAwaitHostConnectState", "Connection channel disconnected")

		return "disconnected", {
			engine_reason = reason
		}
	end

	if self._got_reply then
		return "connected"
	end

	if shared_state.timeout < self._time then
		Log.info("LocalAwaitHostConnectState", "Timeout waiting for rpc_check_connected_reply")

		return "timeout", {
			game_reason = "timeout"
		}
	end
end

LocalAwaitHostConnectState.rpc_check_connected_reply = function (self, channel_id)
	self._got_reply = true
end

return LocalAwaitHostConnectState