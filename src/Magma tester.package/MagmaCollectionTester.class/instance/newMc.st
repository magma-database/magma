private-querys tests
newMc
	"Create a new MagmaCollection with the four indexes used for all the tests."
	^ MagmaCollection new
		addIndex: (MaIntegerIndex attribute: #first) ;
		addIndex: (MaDateIndex attribute: #second) ;
		addIndex: (MaKeywordIndex attribute: #third) ;
		yourself