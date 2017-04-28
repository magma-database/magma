accessing
keysIndexForAttribute: aSymbol
	aSymbol isNil ifTrue: [ ^ self memberIndex ].
	^ keyIndexesByAttribute 
		at: aSymbol
		ifAbsent: 
			[ MagmaUserError signal: 'The keys index for ' , aSymbol , ' was not found. ' ]