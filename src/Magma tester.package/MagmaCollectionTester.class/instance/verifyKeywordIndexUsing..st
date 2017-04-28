test keyword index
verifyKeywordIndexUsing: smalltalkIndex 
	"smalltalkIndex is a Dictionary of Bags.  Keys of the dictionary are the hash keys of the various keywords.  I run in client1."
	| mc index |
	clientSession abort.
	mc := clientSession root at: 'testKeywordIndex'.
	index := mc indexNamed: #key.
	smalltalkIndex keysAndValuesDo: 
		[ : eachWordOrHashInt : eachBag | 
		eachWordOrHashInt isString ifTrue: 
			[ | reader mcBag stBag |
			self notify: 'verifying keyword ' , eachWordOrHashInt.
			reader := mc where: 
				[ : rdr | 
				rdr 
					read: #key
					at: eachWordOrHashInt ].
			mcBag := (reader asArray: reader size) asBag.
			stBag := smalltalkIndex at: (index indexHashForIndexObject: eachWordOrHashInt).
			self should: [ mcBag = stBag ] ] ]