printing
maPrintAbbreviatedOn: aStream

	self
		maPrintAttributes: #(recordNumber lowKey highKey entryWeight possibleKeys canHoldDuplicateKeys)
		on: aStream.
	aStream cr; maPrint: 'entries:'.
	self dumpEntriesTo: aStream