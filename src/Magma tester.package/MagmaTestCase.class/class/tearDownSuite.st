framework
tearDownSuite
	super tearDownSuite.
	self new
		disconnectClients ;
		remotePerform: #stopServer
			in: 'server'