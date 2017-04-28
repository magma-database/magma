removed
hasRemoved: anObject
	^ self hasRemoved and: [self removed includesKey: anObject]