private-report generation
printVersionOn: aWriteStream 
	self 
		printFieldNamed: 'version'
		value: self filer version
		on: aWriteStream.
	[ self filer validateVersion ] 
		on: MagmaUserError
		do: 
			[ : err | 
			self 
				printInvalidOn: aWriteStream
				withMessage: err messageText ]