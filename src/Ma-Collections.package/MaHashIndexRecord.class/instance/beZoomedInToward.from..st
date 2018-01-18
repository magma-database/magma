building
beZoomedInToward: keyInteger from: aMaHashIndexRecord
	"Set the receivers low and highIndex to the correct range that can
	accomodate the index where keyInteger belongs in aMaHashIndexRecord."

	| index |

	index := aMaHashIndexRecord slotIndexFor: keyInteger.
	self
		beFrom: (aMaHashIndexRecord lowestKeyAtIndex: index)
		to: (aMaHashIndexRecord highestKeyAtIndex: index)
