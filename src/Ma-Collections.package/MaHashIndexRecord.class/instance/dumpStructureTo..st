debugging
dumpStructureTo: aStream
	self
		maPrintAttributes: #(
			recordNumber lowKey highKey canHoldDuplicateKeys keys recordNumbers values
			allNumberOfChildren possibleKeys)
		on: aStream