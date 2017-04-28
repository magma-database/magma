test immutable strategy
testImmutabilityStrategyByClass
	self
		
		remotePerform: #setupTestImmutabilityStrategyByClass
		in: 'client1' ;
		
		remotePerform: #commitWithImmutabilityStrategyByClass
		in: 'client2' ;
		
		remotePerform: #verifyByClassNotCommitted
		in: 'client1'