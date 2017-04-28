other small tests
verifyUpdateByteObjects
	clientSession abort.
	self should: [ (clientSession root at: 'testUpdateByteObjects') first first == $H ].
	self should: 
		[ (clientSession root at: 'testUpdateByteObjects') last first == $H asciiValue ]