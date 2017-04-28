initializing
shutDown: aboutToQuit 
	super shutDown: aboutToQuit.
	ConnectedSessions do: [ : each | each isConnected ifTrue: [ each primDisconnect ] ]