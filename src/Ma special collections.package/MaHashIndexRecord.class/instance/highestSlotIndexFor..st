private
highestSlotIndexFor: keyInteger

	^ canHoldDuplicateKeys
		ifTrue:
			[ (self slotIndexFor: keyInteger + 1) - 1 ]
		ifFalse:
			[ self slotIndexFor: keyInteger ]