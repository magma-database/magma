test immutable strategy
setupTestImmutabilityStrategyByClass
	clientSession commit:
		[ clientSession root
			at: #testImmutabilityStrategyByClass
			put: {'class-level immutable string'. 
				'mutable string'.
				'replace this string'} ]