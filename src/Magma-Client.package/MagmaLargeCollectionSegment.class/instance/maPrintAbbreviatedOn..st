printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	aStream
		space ;
		maPrint: startIndex ;
		maPrint: '..' ;
		maPrint: self endIndex 