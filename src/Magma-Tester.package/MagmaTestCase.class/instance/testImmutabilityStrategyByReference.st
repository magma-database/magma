test immutable strategy
testImmutabilityStrategyByReference
	self
		 setupTestImmutabilityStrategy ;
		
		remotePerform: #commitWithImmutabilityStrategy
		in: 'client1' ;
		
		remotePerform: #verifyNotCommitted
		in: 'client2'