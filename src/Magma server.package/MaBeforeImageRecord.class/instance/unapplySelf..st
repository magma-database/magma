recovery
unapplySelf: aMaTransactionalFileStream 
	aMaTransactionalFileStream
		maWrite: self recordSize
			bytesFromPosition: 1
			of: self record
			atFilePosition: self location ;
		maCommit