accessing
size

	^ session isNil
		ifTrue:
			[ changes maxIndex ]
		ifFalse:
			[ (session sizeOfLargeCollection: self) max: changes maxIndex ]