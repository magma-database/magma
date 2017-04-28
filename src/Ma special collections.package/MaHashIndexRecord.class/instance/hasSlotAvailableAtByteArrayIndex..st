testing
hasSlotAvailableAtByteArrayIndex: anInteger
	^ (self controlAtByteArrayIndex: anInteger) maIsBitClear: self slotFilledControlBit