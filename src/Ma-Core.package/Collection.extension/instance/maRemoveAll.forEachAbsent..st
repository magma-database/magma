*ma-core
maRemoveAll: aCollection forEachAbsent: aBlock

	^aCollection do:
		[ :element |
		self
			remove: element
			ifAbsent: [ aBlock value: element ] ]
