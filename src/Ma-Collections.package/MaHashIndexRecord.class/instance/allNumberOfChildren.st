printing
allNumberOfChildren
	"This is intended to be used only for printing!"

	^(self headerSize
		to: byteArray size - 1
		by: entrySize)
			collect: [ :index | self numberOfChildrenAtByteArrayIndex: index ]
