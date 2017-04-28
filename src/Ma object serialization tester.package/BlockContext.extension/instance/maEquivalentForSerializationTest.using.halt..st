*ma object serialization tester
maEquivalentForSerializationTest: aBlockContext using: anIdentityKeyDictionary halt: aBoolean
	self == aBlockContext ifTrue: [ ^ true ].
	aBlockContext maOriginalClass = self maOriginalClass ifFalse: [ ^ false ].
	^ self method = aBlockContext method
	and: [ self numArgs = aBlockContext numArgs
	and: [ self startpc = aBlockContext startpc ] ]