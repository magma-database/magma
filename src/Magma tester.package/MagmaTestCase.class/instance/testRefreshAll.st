test refreshAll
testRefreshAll
	self 
		remotePerform: #createObjectToBeDormantInImage
		in: 'client1'.
	self 
		remotePerform: #cacheDormantAndDisconnect
		in: 'client2'.
	self 
		remotePerform: #updateDormantObject
		in: 'client1'.
	self 
		remotePerform: #reconnectAndVerifyDormantUpdated
		in: 'client2'