creation
className: aSymbol

	^(super className: aSymbol)
		initializeFrom: (Smalltalk classNamed: aSymbol) ;
		yourself