printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	lastKnownSize ifNotNil: 
		[ aStream
			maPrint: ' of ' ;
			maPrint: lastKnownSize ].
	aStream
		maPrint: ' | ' ;
		maPrint: mergedCount