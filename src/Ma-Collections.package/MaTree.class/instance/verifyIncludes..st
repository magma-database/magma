private
verifyIncludes: anObject 
	(self includes: anObject) ifFalse: 
		[ self error: self printString , ' does not include ' , anObject printString ]