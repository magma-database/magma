expressions
read: attributeSymbol from: startKey upTo: endKey
      "Answers a MaLargeCollectionReader with access to all of my elements between startKey and endKey, but NOT including endKey.  This is useful with MaByteSequenceIndexDefinitions where you want to find all matching the left-side of a particular key."

	| index |
	index := self indexNamed: attributeSymbol.
	^ self
		readIndex: index
		fromHash: (index indexHashForIndexObject: startKey)
		toHash: ((index indexHashForIndexObject: endKey) - 1 max: 0)