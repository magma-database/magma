*ma-serializer-tests
maEquivalentForSerializationTest: aSymbol using: alreadyComparedDictionary halt: aBoolean
	aSymbol isSymbol ifFalse: [ ^ false ].
	^ self == aSymbol