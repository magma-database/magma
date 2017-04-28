test connectionless requests
testDisconnectReconnect
	"Just disconnecting and reconnecting would force the magmaId to be validated."
	self 
		remotePerform: #performDisconnectReconnect
		in: 'client1'