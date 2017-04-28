class fileouts
browseClassNamed: nameSymbol
	"Opens a code-file browser on the class named nameSymbol."

	FileContentsBrowser browseStream: (self classNamed: nameSymbol)