*ma-core
localRepositories
	^ self repositories select: [ : each | each isDirectoryRepository ]