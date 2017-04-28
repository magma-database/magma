test immutable strategy
commitWithImmutabilityStrategy
	| array |
	clientSession immutabilityStrategy
		
		treatObjectReferencedBy: 'value'
		onAny: Association
		asImmutableIf:
			[ : assoc | assoc key isString and: [ assoc key beginsWith: 'immutable'] ] ;
		
		treatObjectReferencedBy: 'birthday'
		onAny: MagmaPerson
		asImmutableIf:
			[ : person | person name beginsWith: 'immutable' ].
	array := clientSession refresh root at: #testImmutabilityStrategyByReference.
	self
		 assert: array first key maIsMutatingProxy not ;
		 assert: array first value maIsMutatingProxy not ;
		 assert: array second key maIsMutatingProxy not ;
		 assert: array second value birthday maIsMutatingProxy.
	clientSession commit:
		[ array first value at: 1 put: $H.
		array second value birthday makeUTC.
		array third value at: 1 put: $A ]