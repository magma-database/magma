as yet unclassified
initialize
	ControlEntryOffset := 0.
	SizeOfControlFieldInBits := 8.
	SizeOfControlFieldInBytes := SizeOfControlFieldInBits / 8.
	SizeOfRecordNumberInBits := 32.
	SizeOfRecordNumberInBytes := SizeOfRecordNumberInBits / 8.
	SlotFilledControlBit := 1.
	ValueEntryOffset := ControlEntryOffset + SizeOfControlFieldInBytes