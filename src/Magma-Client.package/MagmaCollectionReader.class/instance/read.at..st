expressions
read: attributeSymbol at: key
	"Answers a MaLargeCollectionReader with access to all elements at key."

	^ self
		read: attributeSymbol
		from: key
		to: key