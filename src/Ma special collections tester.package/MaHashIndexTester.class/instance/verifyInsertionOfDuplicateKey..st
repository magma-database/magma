private tests
verifyInsertionOfDuplicateKey: keyInteger
	"Test the insertion of a many of the same key, requiring the
	receivers index to zoom all the way into that key and getting
	into the inverted records."

	25 timesRepeat: [ self addKey: keyInteger ].
	self should:
		[ (self index
			upTo: 100
			at: keyInteger) last
				size = 25 ].
	275 timesRepeat: [ self addKey: keyInteger ].
	self should:
		[ (self index
			upTo: 350
			at: keyInteger) last
				size = 300 ]
