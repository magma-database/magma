*ma base additions
localRepositories
	^ self repositories select: [ : each | each isDirectoryRepository ]