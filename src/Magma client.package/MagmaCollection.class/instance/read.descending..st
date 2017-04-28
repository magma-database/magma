accessing
read: attributeSymbol descending: aBoolean 
	"Answers a MaLargeCollectionReader ordered on attributeSymbol"
	| index reader |
	index := self indexNamed: attributeSymbol.
	reader := self newReader.
	reader 
		readIndex: index
		fromHash: index lowestPossibleKey
		toHash: index highestPossibleKey.
	reader descending: aBoolean.
	^ reader