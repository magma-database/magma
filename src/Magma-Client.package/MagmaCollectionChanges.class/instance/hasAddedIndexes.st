testing
hasAddedIndexes

	^(changes includesKey: #addedIndexes) and: [ self addedIndexes notEmpty ]
