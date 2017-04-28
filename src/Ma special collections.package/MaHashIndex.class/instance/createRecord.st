initializing
createRecord

	record :=
		(MaHashIndexRecord
			keySize: keySize
			valueSize: valueSize
			numberOfSlots: hashRecordSize)

				beFrom: 0
				to: (2 raisedTo: keySize) - 1;

				recordNumber: 0 ;
				yourself.
	broker recordSize: record bufferSize