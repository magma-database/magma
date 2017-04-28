api
close: aStandardFileStream 
	| stream |
	guard critical: 
		[ stream := openStreams 
			remove: aStandardFileStream
			ifAbsent: [ nil ].
		stream ifNotNil: [ stream close ] ]