api
renewAccess: aStandardFileStream 
	"Add or move aStandardFileStream to the bottom (most recently accessed), ensuring I do not exceed my limit of simultaneously-allowed open FileStreams."
	guard critical: 
		[ "Performance enhancement:  since many consecutive writes to the same fileStream is common, check if already renewed."
		| existing |
		(openStreams notEmpty and: [ openStreams last == aStandardFileStream ]) ifFalse: 
			[ existing := openStreams 
				remove: aStandardFileStream
				ifAbsent: [ nil ].
			"If already existing, no need to pop anything off, otherwise make sure we don't exceed.."
			existing ifNil: 
				[ [ openStreams size >= maxSize ] whileTrue: [ self close: openStreams first ].
				aStandardFileStream open.
				aStandardFileStream closed ifTrue: 
					[ MagmaEnvironmentError signal: 'Could not open ' , aStandardFileStream name , '.  File in use?' ] ].
			openStreams addLast: aStandardFileStream ] ]