fixtures
magmaCollectionFixture

	^ fixture
		at: #magmaCollectionFixture
		ifAbsentPut: [ MagmaCollection new ]