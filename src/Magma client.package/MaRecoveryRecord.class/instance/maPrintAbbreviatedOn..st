printing
maPrintAbbreviatedOn: aStream
	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttributes: #(physicalSize recordType)
		on: aStream