test UDP ByteArray server
testUdpByteArrayLayer
	self
		remotePerform: #startUdpByteArrayServer
			in: 'server' ;
		remotePerform: #sendOutUdpByteArrayRequestsFrom:to:
			withArguments: #(500 1000 )
			in: 'client1' ;
		remotePerform: #sendOutUdpByteArrayRequestsFrom:to:
			withArguments: #(750 1250 )
			in: 'client2' ;
		remotePerform: #waitUntilDone
			in: 'client1' ;
		remotePerform: #waitUntilDone
			in: 'client2' ;
		remotePerform: #verifyMergedBag
			in: 'server' ;
		remotePerform: #stopServer
			in: 'server'