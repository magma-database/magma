test UDP object server
verifyMostObjectsReceived: aCollection 
	self assert: testObjects size > (aCollection size * 0.8) truncated.
	testObjects do: 
		[ : eachReceivedUdp | 
		self assert: (aCollection anySatisfy: 
				[ : eachTestFixture | 
				eachTestFixture object1 = eachReceivedUdp object1 and: [ eachTestFixture object2 = eachReceivedUdp object2 ] ]) ]