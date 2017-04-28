accessing
keyAtHighestSlotFor: keyInteger
self maMarked: 'delete'.
	^self keyAtByteArrayIndex: (self highestByteArrayIndexFor: keyInteger)
