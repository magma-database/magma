test ByteArray server
testByteArrayLayer
	self
		remotePerform: #startByteArrayServer
			in: 'server' ;
		remotePerform: #startByteArrayRequests
			in: 'client1' ;
		remotePerform: #startByteArrayRequests
			in: 'client2' ;
		remotePerform: #waitUntilDone
			in: 'client1' ;
		remotePerform: #waitUntilDone
			in: 'client2' ;
		remotePerform: #stopServer
			in: 'server' ;
		remotePerform: #verifyServerStopped
			in: 'server'