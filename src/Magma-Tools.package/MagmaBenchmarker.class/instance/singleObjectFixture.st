fixtures
singleObjectFixture
	^ fixture
		at: #singleObjectFixture
		ifAbsentPut: [ WordArray new: 1 ]