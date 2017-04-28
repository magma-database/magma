private
removeConnection: aMaClientConnection 
	clientConnectionsGuard critical: 
		[ clientConnections 
			remove: aMaClientConnection
			ifAbsent: 
				[ "not worth blowing up"
				 ].
		server noteNumberOfConnections: clientConnections size ]