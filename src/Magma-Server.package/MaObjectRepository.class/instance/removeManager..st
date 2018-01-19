building
removeManager: aMagmaCollectionManager 
	self flushCritical: 
		[ self commitCritical: 
			[ (largeCollectionManagers 
				removeKey: aMagmaCollectionManager collectionOid
				ifAbsent: [ nil ]) ifNotNil: [ : removed | removed close ] ] ]