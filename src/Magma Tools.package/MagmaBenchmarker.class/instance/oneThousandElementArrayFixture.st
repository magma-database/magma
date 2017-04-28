fixtures
oneThousandElementArrayFixture

	^ fixture
		at: #oneThousandElementArrayFixture
		ifAbsentPut: [ Array new: 1000 ]