*magma server
requiresServerRefresh
	^ self hasAddedIndexes or: [ self hasRemovedIndexes ]