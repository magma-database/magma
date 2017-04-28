printing
recordNumbers
	"This is intended to be used only for printing!"

	^(self headerSize
		to: byteArray size - 1
		by: entrySize)
			collect: [ :index | self recordNumberAtByteArrayIndex: index ]
