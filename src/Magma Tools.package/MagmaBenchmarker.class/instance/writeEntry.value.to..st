capture context
writeEntry: selectorSymbol value: anObject to: aStream

	aStream
		cr; tab;
		nextPutAll: selectorSymbol withBlanksTrimmed ;
		nextPutAll: ' : ' ;
		maPrint: anObject