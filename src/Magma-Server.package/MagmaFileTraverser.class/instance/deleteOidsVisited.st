private
deleteOidsVisited

	oidsVisited ifNotNil: [ oidsVisited close ].
	directory deleteFileNamed: self tempOidsVisitedFilename