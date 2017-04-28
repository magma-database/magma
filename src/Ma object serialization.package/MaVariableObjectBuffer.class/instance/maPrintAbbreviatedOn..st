printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttributes: #(#oids )
		on: aStream