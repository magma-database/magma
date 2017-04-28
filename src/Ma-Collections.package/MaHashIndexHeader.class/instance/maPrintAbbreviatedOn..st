printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	self 
		maPrintAttributes: #(
				#version
				#keySize
				#valueSize
				#recordSize
			)
		on: aStream