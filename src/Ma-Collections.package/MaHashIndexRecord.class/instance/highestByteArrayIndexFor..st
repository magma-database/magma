accessing
highestByteArrayIndexFor: keyInteger
	"This will vary from the lowestByteArrayIndexFor: keyInteger only when the receiver canHoldDuplicateKeys."

	^ self byteArrayIndexFor: (self highestSlotIndexFor: keyInteger)