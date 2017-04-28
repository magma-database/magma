test storing a session
testStoringMagmaSession
	self
		remotePerform: #commitReferenceToSession
		in: 'client1'.
	self
		remotePerform: #verifyReferenceToSession
		in: 'client2'