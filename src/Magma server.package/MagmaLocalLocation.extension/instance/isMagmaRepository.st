*magma server
isMagmaRepository
	^ self directory exists and: [ self directory fileExists: MaObjectFiler objectsPhysicalFilename ]