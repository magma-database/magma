printing
maPrintAbbreviatedOn: aStream

	aStream
		nextPutAll: self first;
		space;
		nextPutAll: self last
