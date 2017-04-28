removed indexes
removedIndexes

	^changes
		at: #removedIndexes
		ifAbsentPut: [ OrderedCollection new ]
