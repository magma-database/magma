accessing
highestByteArrayIndexForAnyKeyAt: byteArrayIndex
	"this is for records that canHoldDuplicateKeys when we need to find the next child record number, since that is stored at the highestByteArrayIndexFor: that key."

	^self highestByteArrayIndexFor: (self lowestKeyAtIndex: (self slotIndexForBax: byteArrayIndex))