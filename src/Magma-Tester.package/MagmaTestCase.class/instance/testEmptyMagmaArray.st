test MagmaArray
testEmptyMagmaArray
	self assert: MagmaArray new isEmpty.
	self
		remotePerform: #createEmptyMagmaArray in: 'client1' ;
		remotePerform: #verifyEmptyMagmaArray in: 'client2'
		