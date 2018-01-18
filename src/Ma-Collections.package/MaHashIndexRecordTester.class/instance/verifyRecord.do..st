private tests
verifyRecord: aMaHashIndexRecord do: twoArgBlock

	self
		verifyConsecutiveContiguousKeyRangesOn: aMaHashIndexRecord;
		verifyEntryIndexAndRangeEndpointCongruenceOn: aMaHashIndexRecord.
	aMaHashIndexRecord
		byteArrayIndexesFrom: 0
		do:
			[ : eachBax |
			twoArgBlock value: aMaHashIndexRecord value: eachBax.
			(aMaHashIndexRecord highKey - aMaHashIndexRecord lowKey) > 1  "if not fully zoomed in"
				ifTrue:
					[ | x lowestKey highestKey |
					x := aMaHashIndexRecord slotIndexForBax: eachBax.
					lowestKey := aMaHashIndexRecord lowestKeyAtIndex: x.
					highestKey := aMaHashIndexRecord highestKeyAtIndex: x.
					self
						verifyRecord:
							(aMaHashIndexRecord independentCopy
								beZoomedInToward: (lowestKey to: highestKey) atRandom
								from: aMaHashIndexRecord)
						do: twoArgBlock ] ]