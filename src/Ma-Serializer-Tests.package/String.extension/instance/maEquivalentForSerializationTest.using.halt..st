*ma-serializer-tests
maEquivalentForSerializationTest: aString using: alreadyComparedDictionary halt: aBoolean
	aString isString ifFalse: [ ^ false ].
	^ self = aString