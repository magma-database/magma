accessing
keyAtHighestSlotFor: keyInteger

	^self keyAtByteArrayIndex: (self highestByteArrayIndexFor: keyInteger)
