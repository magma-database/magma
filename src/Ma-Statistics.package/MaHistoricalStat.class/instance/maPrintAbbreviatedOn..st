printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	self 
		maPrintAttributes: #(#endTime #name )
		on: aStream