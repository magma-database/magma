private tests
verifyConsecutiveContiguousKeyRangesOn: aMaHashIndexRecord

	0
		to: aMaHashIndexRecord numberOfSlots - 2
		do:
			[ : index |
			self should:
				[ aMaHashIndexRecord canHoldDuplicateKeys
					ifTrue:
						[ ((aMaHashIndexRecord lowestKeyAtIndex: index + 1) -
							(aMaHashIndexRecord highestKeyAtIndex: index))
								between: 0
								and: 1 ]
					ifFalse:
						[ ((aMaHashIndexRecord lowestKeyAtIndex: index + 1) -
							(aMaHashIndexRecord highestKeyAtIndex: index)) = 1 ] ] ]