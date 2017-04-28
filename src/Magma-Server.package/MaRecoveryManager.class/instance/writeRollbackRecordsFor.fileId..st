record
writeRollbackRecordsFor: aMaAtomicFileStream fileId: fileId 
	aMaAtomicFileStream isNew 
		ifTrue: 
			[ self 
				writeNewFileRecordFrom: aMaAtomicFileStream
				fileId: fileId ]
		ifFalse: 
			[ self 
				writeBeforeImageRecordsFrom: aMaAtomicFileStream
				fileId: fileId ]