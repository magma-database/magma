printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttributes: #(#byteCodesPlusTrailerSize #bytes )
		on: aStream