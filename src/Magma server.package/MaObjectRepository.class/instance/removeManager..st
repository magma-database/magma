building
removeManager: aMagmaCollectionManager 
	self flushCritical: 
		[ self commitCritical: 
			[ (largeCollectionManagers 
				removeKey: aMagmaCollectionManager collectionOid
				ifAbsent: [ nil ]) ifNotNilDo: [ : removed | removed close ] ] ]