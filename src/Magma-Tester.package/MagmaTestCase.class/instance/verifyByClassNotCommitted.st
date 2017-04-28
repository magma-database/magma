test immutable strategy
verifyByClassNotCommitted
	| array |
	clientSession refresh.
	array := clientSession root at: #testImmutabilityStrategyByClass.
	self
		 assert: array first value = 'class-level immutable string' ;
		 assert: array second value = 'Mutable string' ;
		 assert: array third = 'replacement string'