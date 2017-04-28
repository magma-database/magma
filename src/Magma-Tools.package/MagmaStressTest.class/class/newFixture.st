initialize
newFixture
	^ MagmaCollection new
		addIndex: (MaIntegerIndex attribute: #key) ;
		yourself