added indexes
addedIndexes

	^changes
		at: #addedIndexes
		ifAbsentPut: [ OrderedCollection new ]
