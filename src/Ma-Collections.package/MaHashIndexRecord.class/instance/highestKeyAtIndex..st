accessing
highestKeyAtIndex: anInteger

	^canHoldDuplicateKeys
		ifTrue:
			[ self lowestKeyAtIndex: anInteger ]
		ifFalse:
			[ (self lowestKeyAtIndex: anInteger + 1) - 1 ]
