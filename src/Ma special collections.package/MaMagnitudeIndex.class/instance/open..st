private
open: aReadWriteStream

	super open: aReadWriteStream.
	nextRecordNumber := broker nextRecordNumber.
	nextRecordNumber isInteger
		ifFalse:
			[ MaSpecialCollectionsSoftwareError signal: 'Invalid index size.  Requires maintenance tool.' ]