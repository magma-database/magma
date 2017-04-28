private
occupySlotAtByteArrayIndex: anInteger 
	| controlValue |
	controlValue := self controlAtByteArrayIndex: anInteger.
	self 
		controlAtByteArrayIndex: anInteger
		put: (controlValue maBitSet: self slotFilledControlBit)