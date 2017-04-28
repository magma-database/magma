printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttributes: #(#classVersion #oids )
		on: aStream