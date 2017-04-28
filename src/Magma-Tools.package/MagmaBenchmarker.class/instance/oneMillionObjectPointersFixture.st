fixtures
oneMillionObjectPointersFixture
	^ fixture
		at: #oneMillionObjectPointersFixture
		ifAbsentPut:
			[ WbArray withAll:
				((1 to: 1000) collect:
					[ : x | WbArray new: 1000 ]) ]