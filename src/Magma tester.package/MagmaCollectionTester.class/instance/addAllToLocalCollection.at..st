client
addAllToLocalCollection: aCollection at: aString

	(localRoot
		at: aString
		ifAbsentPut: [ OrderedCollection new ])
			addAll: aCollection.