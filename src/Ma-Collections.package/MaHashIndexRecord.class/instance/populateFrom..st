building
populateFrom: aMaHashIndexRecord
	byteArray
		replaceFrom: 1
		to: byteArray size
		with: aMaHashIndexRecord byteArray.
	recordNumber := aMaHashIndexRecord recordNumber.
	self resetForNewKeyRange