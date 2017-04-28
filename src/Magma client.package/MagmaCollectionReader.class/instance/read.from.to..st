expressions
read: attributeSymbol from: startKey to: endKey
	"Answers a MaLargeCollectionReader with access to all of my elements between startKey and endKey."

	| index |
	index := self indexNamed: attributeSymbol.
	^ self
		readIndex: index
		fromHash: (index indexHashForIndexObject: startKey)
		toHash: (index indexHashForIndexObject: endKey)