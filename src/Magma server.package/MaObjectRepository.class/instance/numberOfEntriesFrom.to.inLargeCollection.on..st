client-requests
numberOfEntriesFrom: lowKeyInteger to: highKeyInteger inLargeCollection: collectionOid on: attributeSymbol 
	| index |
	index := (self collectionManagerFor: collectionOid) 
		oidsIndexForAttribute: attributeSymbol.
	^ index 
		numberOfEntriesFrom: lowKeyInteger
		to: highKeyInteger