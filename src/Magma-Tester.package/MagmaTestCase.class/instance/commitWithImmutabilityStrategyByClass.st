test immutable strategy
commitWithImmutabilityStrategyByClass
	| array |
	clientSession immutabilityStrategy
		treatAny: String
		asImmutableIf:
			[ : string | string beginsWith: 'class-level immutable' ].
	array := clientSession refresh root at: #testImmutabilityStrategyByClass.
	clientSession commit:
		[ array first
			at: 1
			put: $X.
		array second
			at: 1
			put: $M.
		array
			at: 3
			put: 'replacement string' ]