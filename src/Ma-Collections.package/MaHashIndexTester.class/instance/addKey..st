private actions
addKey: keyInteger

	| value |
	self index
		add: (value := self getNextValue)
		at: keyInteger.
	sortedKeys add: keyInteger.
	(values
		at: keyInteger
		ifAbsentPut: [ OrderedCollection new ])
			add: value.
	predictedSize := predictedSize + 1.
	^ value