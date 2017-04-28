record
writeNewFileRecordFrom: aMaTransactionalFileStream fileId: fileId

	self preMadeNewFileRecord
		filename: aMaTransactionalFileStream filename ;
		fileId: fileId ;
		groupId: groupId ;
		writeTo: applyFile