printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	self
		maPrintAttributes: #(#classVersion #oids "#infos")
		on: aStream