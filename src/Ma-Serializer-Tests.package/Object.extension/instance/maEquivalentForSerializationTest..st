*ma-serializer-tests
maEquivalentForSerializationTest: anObject
	"(sigh)  Floats and streams need their own equivalence checking."
	^ self
		maEquivalentForSerializationTest: anObject 
		using: MaIdentityDictionary new
		halt: true