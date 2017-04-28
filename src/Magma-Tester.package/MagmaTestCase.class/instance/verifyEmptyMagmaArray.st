test MagmaArray
verifyEmptyMagmaArray
	clientSession refresh.
	self assert: (clientSession root at: #testEmptyMagmaArray) isEmpty