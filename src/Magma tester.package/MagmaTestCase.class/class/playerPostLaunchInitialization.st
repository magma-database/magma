framework
playerPostLaunchInitialization
	super playerPostLaunchInitialization.
	self isConductorImage ifTrue: 
		[ self loadCode.
		self new
			playersDo: [ : each | each setTestCaseClass: MagmaCollectionTester ] ;
			remotePerform: #startServer:
				withArguments: {  true  }
				in: 'server' ;
			connectClients ]