building
keySize: keyBits valueSize: valueBits numberOfSlots: numberOfSlotsInteger
	keySize := keyBits.
	valueSize := valueBits.
	numberOfSlots := numberOfSlotsInteger.
	"Each entry consists of:  value, record number, key, number of child entries."
	entrySize := SizeOfControlFieldInBytes + (valueSize/8) + SizeOfRecordNumberInBytes + ((keySize / 8) * 2).
	byteArray := ByteArray new: self headerSize + (entrySize * numberOfSlotsInteger)