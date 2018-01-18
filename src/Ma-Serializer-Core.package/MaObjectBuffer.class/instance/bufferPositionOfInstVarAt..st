private
bufferPositionOfInstVarAt: anInteger
	"Answer the physical 0-based byte-position within the receivers byteArray
	where the instVar with index anInteger is located."

	^ self headerSize + ((anInteger - 1) * self slotSize)