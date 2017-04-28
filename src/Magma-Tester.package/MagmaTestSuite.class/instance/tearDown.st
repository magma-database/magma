setup-teardown
tearDown
	orchestra isConductorImage ifTrue:
		[ "'server2'"
		#('server' ) do:
			[ : each | tests anyOne
				remotePerform: #assertNoMagmaCollectionIndexClass
				in: each ].
		tests anyOne
			 disconnectClients ;
			
			remotePerform: #stopServer
			in: 'server'.
		super tearDown ]