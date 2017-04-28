private
initializeOidsVisited

	oidsVisited ifNotNil: [ self deleteOidsVisited ].
	oidsVisited := 
		MaLargeArrayOfNumbers
			createNamed: self tempOidsVisitedFilename
			bitSize: MaObjectFiler maxDbSize