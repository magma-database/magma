printing
maPrintAbbreviatedOn: aStream

	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttribute: #version
		on: aStream