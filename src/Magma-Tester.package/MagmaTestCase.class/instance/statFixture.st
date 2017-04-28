test MagmaStat
statFixture
	^ statFixture ifNil: [ statFixture := clientSession root at: #testMagmaStat ]