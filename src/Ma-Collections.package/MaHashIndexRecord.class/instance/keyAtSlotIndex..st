accessing
keyAtSlotIndex: anInteger

	^ self keyAtByteArrayIndex: (self byteArrayIndexFor: anInteger)