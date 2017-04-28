*magma server
process
	(self repository 
		collectionManagerFor: collectionOid
		ifAbsent: [ nil ]) ifNotNilDo: [ : aMagmaCollectionManager | aMagmaCollectionManager wantsReleased: true ]