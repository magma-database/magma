printing
printDetailsOn: aStream
	super printDetailsOn: aStream.
	aStream
		maPrintAttributes: #(#oidOfMissingBuffer #referencingBuffer )
		on: aStream