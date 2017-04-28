printing
maPrintAbbreviatedOn: aStream 
	self
		maPrintAttributes: #(#oid #classId #objectInstSize #commitNumber #oids)
		on: aStream