printing
maPrintAbbreviatedOn: aStream
	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttributes: #(fileId)
		on: aStream