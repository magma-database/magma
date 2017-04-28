*ma-serializer-core
maInstSize
	^ (self between: -1073741824 and: 1073741823)
		ifTrue: [ 0 ]
		ifFalse: [ self digitLength ]