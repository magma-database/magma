private
vacateSlotAtByteArrayIndex: anInteger 
	| controlValue |
	controlValue := self controlAtByteArrayIndex: anInteger.
	self 
		controlAtByteArrayIndex: anInteger
		put: (controlValue maBitClear: self slotFilledControlBit)