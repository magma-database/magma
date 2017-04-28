testing
hasChanges
	^ super hasChanges
		or: [ self hasChangedKeys
		or: [ self hasLockSpecified
		or: [ self hasAddedIndexes
		or: [ self hasNewIndexValues
		or: [ self hasRemoved
		or: [ self hasRemovedIndexes ] ] ] ] ] ]