*ma object serialization tester
maEquivalentForSerializationTest: aByteArray using: anIdentityKeyDictionary halt: aBoolean
	self == aByteArray ifTrue: [ ^ true ].
	(aByteArray isKindOf: self species) ifFalse: [ ^ false ].
	^ self = aByteArray