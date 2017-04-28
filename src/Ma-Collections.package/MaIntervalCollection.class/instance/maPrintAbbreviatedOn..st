printing
maPrintAbbreviatedOn: aStream
	super maPrintAbbreviatedOn: aStream.
	intervals do:
		[ : each |
		aStream 
			maPrint: each first ;
			maPrint: '..' ;
			maPrint: each last ;
			space ]