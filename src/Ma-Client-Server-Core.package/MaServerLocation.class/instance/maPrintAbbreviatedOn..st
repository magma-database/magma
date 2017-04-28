printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	aStream
		maPrint: host ;
		maPrint: $: ;
		maPrint: port