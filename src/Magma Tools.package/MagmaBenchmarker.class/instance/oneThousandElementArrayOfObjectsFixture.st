fixtures
oneThousandElementArrayOfObjectsFixture

	^ fixture
		at: #oneThousandElementArrayOfObjectsFixture
		ifAbsentPut:
			[ Array withAll: ((1 to: 1000) collect: [ : x | Array new: 1 ]) ]