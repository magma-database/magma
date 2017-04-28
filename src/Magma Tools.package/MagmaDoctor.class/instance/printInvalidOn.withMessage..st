private-report generation
printInvalidOn: aWriteStream withMessage: aString 
	self 
		printLabel: self invalid
		value: aString
		withAttributes: self problemAttributes
		on: aWriteStream