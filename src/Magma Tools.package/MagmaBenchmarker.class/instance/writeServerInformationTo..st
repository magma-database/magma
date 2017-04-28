capture context
writeServerInformationTo: aStream

	session isLocal ifFalse: [ ^ self "may want to figure out how to do this some day." ].
	aStream
		cr; cr;
		nextPutAll: 'Magma server details:'.
	#(flushAggressively)
		do:
			[ : each | 
			self
				writeEntry: each
				value: (session repositoryController perform: each)
				to: aStream ]