private
removeConnection: aMaClientConnection 
	clientConnectionsGuard critical: 
		[ clientConnections 
			remove: aMaClientConnection
			ifAbsent: 
				[ "not worth blowing up"
				 ].
		console noteNumberOfConnections: clientConnections size ]