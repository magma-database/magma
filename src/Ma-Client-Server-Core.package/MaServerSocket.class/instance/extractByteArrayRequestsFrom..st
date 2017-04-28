private
extractByteArrayRequestsFrom: aMaServerRequestLifecycle 
	"A socket connection has just been established.  Kickoff a new iterating process for the purpose of listening for requests bytes from a single client.  receiveOneByteArrayRequestFrom: waits a few seconds on the port, if data comes in it will extract the entire request and return it.  Otherwise it returns nil and the loop can check for shutdown or expiry."
	clientConnectionsGuard critical: 
		[ 1 
			to: clientConnections size - self maxConnections
			do: [ : n | (clientConnections at: n) shouldContinue: false ].
		clientConnections add: (MaClientConnection 
				serverSocket: self
				lifecycle: aMaServerRequestLifecycle) monitorForByteArrayRequests.
		console noteNumberOfConnections: clientConnections size ]