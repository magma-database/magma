private-report generation
printSignatureOn: aWriteStream 
	self 
		printFieldNamed: 'signature'
		value: self filer signature
		on: aWriteStream.
	[ self filer validateSignature ] 
		on: MagmaUserError
		do: 
			[ : err | 
			self 
				printInvalidOn: aWriteStream
				withMessage: err messageText ]