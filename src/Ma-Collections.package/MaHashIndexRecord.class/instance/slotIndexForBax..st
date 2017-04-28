accessing
slotIndexForBax: anInteger
	"Bax means 'byteArrayIndex'."

	^(anInteger - self headerSize) / entrySize