printing
maPrintAbbreviatedOn: aStream
	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttributes: #(isBeginApply)
		on: aStream