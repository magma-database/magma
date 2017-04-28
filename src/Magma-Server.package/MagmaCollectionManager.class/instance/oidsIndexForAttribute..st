accessing
oidsIndexForAttribute: aSymbol
	aSymbol isNil ifTrue: [ ^ self memberIndex ].
	^ oidIndexesByAttribute 
		at: aSymbol
		ifAbsent: 
			[ MagmaUserError signal: 'The oids index for ' , aSymbol , ' was not found. ' ]