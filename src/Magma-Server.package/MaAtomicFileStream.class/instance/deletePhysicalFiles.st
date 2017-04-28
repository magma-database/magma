accessing
deletePhysicalFiles
	self directory in: [ : dir | self physicalFilenamesDo: [ : each | dir deleteFileNamed: each ] ]