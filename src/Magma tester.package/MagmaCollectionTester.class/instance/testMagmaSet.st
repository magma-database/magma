test MagmaSet
testMagmaSet
	self
		remotePerform: #createAndPopulateMagmaSet
		in: 'client1'.
	self
		remotePerform: #verifyMagmaSet
		in: 'client2'.
	self
		remotePerform: #verifyReducedMagmaSet
		in: 'client1'.
