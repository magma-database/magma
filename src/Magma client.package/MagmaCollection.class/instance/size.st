accessing
size

	^ session isNil
		ifTrue:
			[ changes deltaSize ]
		ifFalse:
			[ (session sizeOfLargeCollection: self) + changes deltaSize ]