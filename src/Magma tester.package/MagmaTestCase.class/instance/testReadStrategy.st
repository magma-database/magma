test ReadStrategy
testReadStrategy
	self
		remotePerform: #setUpReadStrategyTest
			in: 'client1' ;
		remotePerform: #verifyReadStrategyFunctionality
			in: 'client2'