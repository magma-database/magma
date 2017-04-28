initialize-release
create: aReadWriteStream

	broker := 
		(MaFileRecordBroker headerSize: self headerSize)
			recordSize: broker recordSize ;
			yourself.
	broker create: aReadWriteStream.
	self writeHeader