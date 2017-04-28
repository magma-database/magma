fixtures
oneThousandElementArrayOfObjectsFixture
	^ fixture
		at: #oneThousandElementArrayOfObjectsFixture
		ifAbsentPut:
			[ WbArray withAll:
				((1 to: 1000) collect:
					[ : x | WbArray new: 1 ]) ]