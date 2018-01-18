*ma-serializer-tests
maEquivalentForSerializationTest: aFloat using: anIdentityKeyDictionary halt: aBoolean
	aFloat isFloat ifFalse: [ ^ false ].
	^ self asIEEE32BitWord = aFloat asIEEE32BitWord 