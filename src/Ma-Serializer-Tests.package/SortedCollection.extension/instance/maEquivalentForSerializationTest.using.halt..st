*ma-serializer-tests
maEquivalentForSerializationTest: aSortedCollection using: anIdentityKeyDictionary halt: aBoolean 
	self == aSortedCollection ifTrue: [ ^ true ].
	aSortedCollection maOriginalClass = self maOriginalClass ifFalse: [ ^ false ].
	self size = aSortedCollection size ifFalse: [ ^ false ].
	1
		to: self size
		do:
			[ : n | 
			((self at: n)
				maEquivalentForSerializationTest: (aSortedCollection at: n)
				using: anIdentityKeyDictionary
				halt: aBoolean) ifFalse: [ ^ false ] ].
	^ true