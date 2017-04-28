*ma-serializer-tests
maEquivalentForSerializationTest: aBlockClosure using: anIdentityKeyDictionary halt: aBoolean 
	self == aBlockClosure ifTrue: [ ^ true ].
	aBlockClosure maOriginalClass = self maOriginalClass ifFalse: [ ^ false ].
	^ (self method equivalentTo: aBlockClosure method) and:
		[ self numArgs = aBlockClosure numArgs and: [ self startpc = aBlockClosure startpc ] ]