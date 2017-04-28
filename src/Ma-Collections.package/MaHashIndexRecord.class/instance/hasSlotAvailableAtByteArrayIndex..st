testing
hasSlotAvailableAtByteArrayIndex: anInteger 
	^ (self controlAtByteArrayIndex: anInteger) maIsBitClear: SlotFilledControlBit