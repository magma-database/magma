private-report generation
printFieldNamed: aString value: anObject on: aWriteStream 
	self 
		printLabel: aString
		value: anObject
		withAttributes: self dataAttributes
		on: aWriteStream