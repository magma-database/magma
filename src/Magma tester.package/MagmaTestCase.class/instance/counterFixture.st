test MagmaCounter
counterFixture
	^ counterFixture ifNil: [ counterFixture := clientSession root at: 'testMagmaCounter' ]