test UDP object server
testUdpObjectLayer
	| sampleObjects1 sampleObjects2 |
	sampleObjects1 := (1 to: 1000) collect: [ : e | MacsTestRequest new ].
	sampleObjects2 := (1 to: 1000) collect: [ : e | MacsTestRequest new ].
	self
		remotePerform: #startUdpObjectServer
			in: 'server' ;
		remotePerform: #sendObjectsToUdpServer:
			with: sampleObjects1
			in: 'client1' ;
		remotePerform: #sendObjectsToUdpServer:
			with: sampleObjects2
			in: 'client2' ;
		remotePerform: #waitUntilDone
			in: 'client1' ;
		remotePerform: #waitUntilDone
			in: 'client2' ;
		remotePerform: #verifyMostObjectsReceived:
			with: sampleObjects1 , sampleObjects2
			in: 'server' ;
		remotePerform: #stopServer
			in: 'server'