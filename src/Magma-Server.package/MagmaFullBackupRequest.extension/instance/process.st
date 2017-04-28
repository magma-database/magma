*magma-server
process
	^ serverPath 
		ifNil: [ repositoryController fullBackup ]
		ifNotNil: [ repositoryController fullBackupToServerPath: serverPath ]