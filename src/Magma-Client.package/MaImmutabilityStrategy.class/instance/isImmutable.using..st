testing
isImmutable: anObject using: aMaTransaction 
	anObject maIsLargeCollection ifTrue: [ ^ false ].
	self
		rememberImmutableReferencesFrom: anObject
		for: aMaTransaction.
	^ immutables includesKey: anObject