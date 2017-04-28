expressions
read: attributeSymbol from: lowKey
	"Answers a MaLargeCollectionReader with access to all of my elements after lowKey."

	| index |
	index := self indexNamed: attributeSymbol.
	^ self
		readIndex: index
		fromHash: (index indexHashForIndexObject: lowKey)
		toHash: index highestPossibleKey