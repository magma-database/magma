accessing
collectionFilenameFor: aMaLargeCollection
	^ self directory fullNameFor:
		(String streamContents:
			[ : stream |
			stream
				print: (self session oidFor: aMaLargeCollection) ;
				nextPutAll: '-members.' ;
				nextPutAll: aMaLargeCollection implementationClass suggestedFileExtension ])