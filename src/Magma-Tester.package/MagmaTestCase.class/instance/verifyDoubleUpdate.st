other small tests
verifyDoubleUpdate
	clientSession abort.
	self should: [ (clientSession root at: 'testDoubleUpdate') = (5 -> 6) ]