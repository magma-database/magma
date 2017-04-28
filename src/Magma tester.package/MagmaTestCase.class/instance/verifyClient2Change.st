test misbehaving client
verifyClient2Change
	clientSession abort.
	self assert: (self getMisbehaveFixture at: 2) value = 'client2 desired change'