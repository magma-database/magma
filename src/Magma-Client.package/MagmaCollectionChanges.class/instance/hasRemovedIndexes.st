testing
hasRemovedIndexes

	^(changes includesKey: #removedIndexes) and: [ self removedIndexes notEmpty ]
