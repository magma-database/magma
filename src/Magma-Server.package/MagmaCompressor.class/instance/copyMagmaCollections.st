private
copyMagmaCollections
	process
		 description: 'Copying MagmaCollection files...' ;
		 unitsVerbPhrase: 'files copied' ;
		 unitsCompleted: 0 ;
		 taskSize: referencedCollections size.
	referencedCollections do:
		[ : eachOid | | sourceManager |
		process advance.
		sourceManager := inputController repository collectionManagerFor: eachOid.
		sourceManager filenames do:
			[ : eachMcFilename | (MaAtomicFileStream fileNamed: (inputController directory fullNameFor: eachMcFilename)) physicalFilenamesDo:
				[ : eachPhysicalName | inputController directory
					maCopyFileNamed: eachPhysicalName
					toDirectory: outputFiler directory ] ] ]