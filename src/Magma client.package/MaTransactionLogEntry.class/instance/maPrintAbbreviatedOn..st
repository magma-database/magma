printing
maPrintAbbreviatedOn: aStream 
	aStream
		maPrint: result userId ;
		maPrint: '(' ;
		maPrint: self sessionId ;
		maPrint: ') '