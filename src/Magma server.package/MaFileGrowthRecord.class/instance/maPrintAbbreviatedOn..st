printing
maPrintAbbreviatedOn: aStream
	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttributes: #(originalSize)
		on: aStream