accessing
read: attributeSymbol
	"Answers a MaLargeCollectionReader ordered on attributeSymbol"

	^ self read: attributeSymbol descending: false
