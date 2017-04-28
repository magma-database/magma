fixtures
initializeFixture

	session commit:
		[ session root
			at: 'benchmarkFixture' 
			put: (fixture := Dictionary new).
		"Force lazy-initialization; it was merely nice to have it with the getter rather than all piled up in one initializer."
		self 
			magmaCollectionFixture ;
			magmaArrayFixture ;
			oneMillionObjectPointersFixture ;
			oneThousandElementArrayFixture ;
			oneThousandElementArrayOfObjectsFixture ;
			singleObjectFixture ;
			thousandLevelDeepFixture ]