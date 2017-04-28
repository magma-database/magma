overriding
createNewLargeCollection
	| fullFilename |
	fullFilename := repository collectionFilenameFor: collection.
	memberIndex := MaLargeArrayOfNumbers 
		create: (
			(MaAtomicFileStream fileNamed: fullFilename)
				pool: repository filePool ;
				yourself)
		bitSize: MaObjectFiler maxDbSize