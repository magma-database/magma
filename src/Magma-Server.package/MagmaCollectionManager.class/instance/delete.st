actions
delete
	self filesDo: 
		[ : eachFile : eachFileId | 
		eachFile close.
		repository directory deleteFileNamed: eachFile filename ]