private tests
verifyEntryIndexAndRangeEndpointCongruenceOn: aMaHashIndexRecord

	0
		to: aMaHashIndexRecord numberOfSlots - 1
		do:
			[ : x |  | key |

			key := aMaHashIndexRecord lowestKeyAtIndex: x.
			self should:
				[ x
					between: (aMaHashIndexRecord slotIndexFor: key)
					and: (aMaHashIndexRecord highestSlotIndexFor: key) ].

			x > 0 ifTrue:
				[ self should: [ (aMaHashIndexRecord highestSlotIndexFor: key-1) < x ] ].

			key := aMaHashIndexRecord highestKeyAtIndex: x.
			self should:
				[ x
					between: (aMaHashIndexRecord slotIndexFor: key)
					and: (aMaHashIndexRecord highestSlotIndexFor: key) ].

			x < (aMaHashIndexRecord numberOfSlots - 1) ifTrue:
				[ self should: [ (aMaHashIndexRecord slotIndexFor: key+1) > x ] ] ]