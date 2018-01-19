*magma-server
process
	(self repository 
		collectionManagerFor: collectionOid
		ifAbsent: [ nil ]) ifNotNil: [ : aMagmaCollectionManager | aMagmaCollectionManager wantsReleased: true ]