recovery
fileManagerFor: aMaApplyRecord ifPresent: oneArgBlock ifAbsent: aBlock

	| fileManager |
	fileManager := aMaApplyRecord fileId
		caseOf:
			{ [ MaApplyRecord objectsFileId ] -> [ filer ].
			[ MaApplyRecord filePositionsFileId ] -> [ filer ] }
		otherwise:
			[ (self 
				collectionManagerFor: aMaApplyRecord collectionOid
				ifAbsent: [ ^ aBlock value ]) indexForFileId: aMaApplyRecord fileId ].
	^ oneArgBlock value: fileManager