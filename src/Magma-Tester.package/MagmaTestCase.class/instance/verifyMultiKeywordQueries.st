testMultiKeywordMatching
verifyMultiKeywordQueries
	| mc mcBeginsWithQueryResult smalltalkBeginsWithQueryResult mcEntireWordQueryResults smalltalkEntireWordQueryResult index |
	clientSession abort.
	mc := clientSession root at: #testMultiKeywordMatching.
	index := mc indexes first.
	mcBeginsWithQueryResult := (mc where: [ : each | each key includesAllPrefixes: #('th' 'fo' ) ]) asArray asBag.
	smalltalkBeginsWithQueryResult := ((1 to: 1000) collect: [ : n | n asWords subStrings -> n ]) asBag select: 
		[ : eachAssoc | 
		#('th' 'fo' ) allSatisfy: 
			[ : eachPrefix | 
			eachAssoc key anySatisfy: 
				[ : eachString | 
				eachString 
					maBeginsWith: eachPrefix
					caseSensitive: false ] ] ].
	"Compare Bags because consistent order is not required."
	self assert: mcBeginsWithQueryResult = smalltalkBeginsWithQueryResult.
	"Now ensure entire keywords search works equally well."
	mcEntireWordQueryResults := (mc where: [ : each | each key includesAllOf: #('three' 'seven' ) ]) asArray asBag.
	smalltalkEntireWordQueryResult := ((1 to: 1000) collect: [ : n | n asWords subStrings -> n ]) asBag select: 
		[ : eachAssoc | 
		#('three' 'seven' ) allSatisfy: 
			[ : eachPrefix | 
			eachAssoc key anySatisfy: 
				[ : eachString | 
				(eachString first: (index meaningfulCharacters min: eachString size)) asLowercase = eachPrefix ] ] ].
	self assert: mcEntireWordQueryResults = smalltalkEntireWordQueryResult