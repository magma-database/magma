test immutable strategy
verifyNotCommitted
	| array |
	clientSession refresh.
	array := clientSession root at: #testImmutabilityStrategyByReference.
	self
		 assert: array first value = 'an immutable string' ;
		 assert: array second value birthday start offset = 2 hours ;
		 assert: array third value = 'Alina'