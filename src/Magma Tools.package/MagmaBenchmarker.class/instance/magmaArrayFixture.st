fixtures
magmaArrayFixture

	^ fixture
		at: #magmaArray
		ifAbsentPut: [ MagmaArray new at: 1000 put: -1; yourself ]