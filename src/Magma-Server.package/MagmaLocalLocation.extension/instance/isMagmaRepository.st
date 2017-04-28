*magma-server-testing
isMagmaRepository
	^ self directory exists and: [ self directory fileExists: MaObjectFiler objectsPhysicalFilename ]