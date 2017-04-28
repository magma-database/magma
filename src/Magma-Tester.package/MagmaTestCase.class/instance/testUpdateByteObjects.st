other small tests
testUpdateByteObjects
	"Make sure that when an object link is updated more than once before another client refreshes it, that it refreshes correctly."
	"Client1, commit a couple of byte objects."
	self 
		remotePerform: #prepareUpdateByteObjects
		in: 'client1'.
	"Client2, commit an update the byte objects.."
	self 
		remotePerform: #performUpdateByteObjects
		in: 'client2'.
	"client1, verify the byte objects.."
	self 
		remotePerform: #verifyUpdateByteObjects
		in: 'client1'