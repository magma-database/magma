initialize-release
disconnectClients

	self
		remotePerform: #disconnect
		in: 'client1'.
	self
		remotePerform: #disconnect
		in: 'client2'