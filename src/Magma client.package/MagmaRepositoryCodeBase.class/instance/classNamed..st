class fileouts
classNamed: aSymbol

	^ classes
		at: aSymbol
		ifAbsent: [ MagmaUserError signal: 'No class named ', aSymbol, ' found here.' ].