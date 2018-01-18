as yet unclassified
benchAllOperations: collectionSize


	^ #( At AtIfAbsent AtIfAbsentPut AtPut AtIfAbsentPut2 ) collect: [:op |
		
		op -> (self benchKnownClasses: op size: collectionSize)
		]
