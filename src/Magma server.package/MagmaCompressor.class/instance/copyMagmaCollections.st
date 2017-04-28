private
copyMagmaCollections
	referencedCollections do: 
		[ : eachOid | 
		| sourceManager |
		sourceManager := inputController repository collectionManagerFor: eachOid.
		sourceManager filenames do: 
			[ : eachMcFilename | 
			(MaAtomicFileStream fileNamed: (inputController directory fullNameFor: eachMcFilename)) physicalFilenamesDo: 
				[ : eachPhysicalName | 
				inputController directory 
					maCopyFileNamed: eachPhysicalName
					toDirectory: outputFiler directory ] ] ]