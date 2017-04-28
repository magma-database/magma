test stale collections
testStaleCollections
	self
		remotePerform: #createMagmaCollection
		in: 'client1'.
	self
		remotePerform: #readMagmaCollection
		in: 'client2'.
	self disconnectClients.
	self
		remotePerform: #verifyMagmaCollection
		in: 'client1'.
	self
		remotePerform: #verifyMagmaCollection
		in: 'client2'