connections
ping
	^ submitGuard critical:
		[ [ self ensureConnected.
		(self primSubmit: 'ping') = 'pong' ]
			on: ConnectionRefused, ConnectionClosed
			do:
				[ : err | false ] ]