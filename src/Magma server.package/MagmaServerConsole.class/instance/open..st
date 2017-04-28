start / stop
open: pathOrMagmaLocalLocation 
	"As indicated, pathOrMagmaLocalLocation may be either the String path (relative or fully-qualified) or a MagmaLocalLocation."
	controller 
		ifNil: 
			[ controller := (MagmaRepositoryController open: pathOrMagmaLocalLocation asMagmaLocalLocation)
				serverStatistics: statistics ;
				yourself ]
		ifNotNil: 
			[ "Reopen existing controller rather than replacing it with a new construction so prior preferences and statistics are preserved."
			controller open: pathOrMagmaLocalLocation asMagmaLocalLocation ]