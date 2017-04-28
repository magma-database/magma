overriding
createNewLargeCollection
	| fullFilename |
	fullFilename := repository collectionFilenameFor: collection.
	memberIndex := MaHashIndex 
		create: (
			(MaAtomicFileStream fileNamed: fullFilename)
				pool: repository filePool ;
				yourself)
		keySize: MaObjectBuffer oidSize
		valueSize: 8
		recordSize: 32