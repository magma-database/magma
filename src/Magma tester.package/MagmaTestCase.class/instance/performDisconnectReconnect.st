test connectionless requests
performDisconnectReconnect
	"Just disconnecting and reconnecting would force the magmaId to be validated."
	self assert: clientSession isConnected.
	clientSession
		disconnect ;
		connectAs: clientSession userId.
	self assert: clientSession magmaId maOriginalClass = MagmaId.
	self assert: clientSession isConnected