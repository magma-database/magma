initialize-release
open: aReadWriteStream

	broker := MaFileRecordBroker headerSize: self headerSize.
	broker open: aReadWriteStream.
	self readHeader