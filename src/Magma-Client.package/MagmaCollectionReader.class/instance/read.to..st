expressions
read: attributeSymbol to: highKey
	"Answers a MaLargeCollectionReader with access to all of my elements up to highKey."

	| index |
	index := self indexNamed: attributeSymbol.
	^ self
		readIndex: index
		fromHash: 0
		toHash: (index indexHashForIndexObject: highKey)