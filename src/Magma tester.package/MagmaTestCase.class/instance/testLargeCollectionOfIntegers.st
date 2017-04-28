test MaLargeArrayOfNumbers
testLargeCollectionOfIntegers
	| lci filename |
	filename := FileDirectory default fullNameFor: '_test_magma_largeArray.idx'.
	"ensure deleted.."
	FileDirectory default 
		deleteFileNamed: '_test_magma_largeArray.idx'
		ifAbsent: 
			[ "no problemo"
			 ].
	lci := MaLargeArrayOfNumbers 
		createNamed: filename
		bitSize: MaObjectFiler maxDbSize.
	lci 
		at: 10000
		put: 33.
	1 
		to: 9999
		do: [ : n | self assert: (lci at: n) = 0 ]