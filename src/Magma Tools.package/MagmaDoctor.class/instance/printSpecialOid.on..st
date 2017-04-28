private-report generation
printSpecialOid: selectorSymbol on: aWriteStream 
	self 
		printFieldNamed: selectorSymbol
		value: (self filer perform: selectorSymbol)
		on: aWriteStream.
	[ self filer validateSpecialOid: selectorSymbol ] 
		on: MagmaCorruptionError
		do: 
			[ : err | 
			self 
				printInvalidOn: aWriteStream
				withMessage: err messageText ]