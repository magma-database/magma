*ma-serializer-tests
maEquivalentForSerializationTest: anObject using: alreadyComparedDictionary halt: shouldHalt
	"Overridden because superclass implementation exposes that it was comparing the physical structure of Integers.  A logical comparison is sufficient and proper, and compatible with 64-bit images."
	^self = anObject