*ma-serializer-core
maEquivalentForSerializationTest: aMethodContext using: anIdentityKeyDictionary halt: aBoolean 
	aMethodContext privRefresh.
	^ super
		maEquivalentForSerializationTest: aMethodContext
		using: anIdentityKeyDictionary
		halt: aBoolean