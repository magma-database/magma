printing
maPrintAbbreviatedOn: aStream
	super maPrintAbbreviatedOn: aStream.
	self depthFirstDo:
		[ : path |
		aStream
			cr;
			tab: path size - 1 ;
			maPrint: path last ]