test object server
testObjectLayer
	self
		remotePerform: #startObjectServer
			in: 'server' ;
		remotePerform: #startObjectRequests
			in: 'client1' ;
		remotePerform: #startObjectRequests
			in: 'client2' ;
		remotePerform: #waitUntilDone
			in: 'client1' ;
		remotePerform: #waitUntilDone
			in: 'client2'.
	self 
		remotePerform: #stopServer
		in: 'server'