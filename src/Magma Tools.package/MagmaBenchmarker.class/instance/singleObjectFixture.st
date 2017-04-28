fixtures
singleObjectFixture

	^ fixture
		at: #singleObjectFixture
		ifAbsentPut: [ Array new: 1 ]