file
deleteFilesQueuedForDelete
	filesToDelete do: 
		[ : eachAtomicFileStream | 
		| fd |
		eachAtomicFileStream deletePhysicalFiles ].
	self initializeFilesToDelete