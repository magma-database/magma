file management
deleteFiles: aCollection

	aCollection do:
		[ :each |
		"StandardFileStream allInstances do:
			[ :eachStream |
			eachStream fullName = each ifTrue:
				[ self notify: 'closing a rogue FileStream for ', eachStream fullName.
				eachStream close ] ]."
		self notify: 'deleting file ', each pathString.
		each deleteIfAbsent: []. ]