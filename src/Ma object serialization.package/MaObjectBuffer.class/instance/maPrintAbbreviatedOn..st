printing
maPrintAbbreviatedOn: aStream 
	self 
		maPrintAttributes: #(
				#oid
				#classId
				#objectInstSize
				#commitNumber
			)
		on: aStream