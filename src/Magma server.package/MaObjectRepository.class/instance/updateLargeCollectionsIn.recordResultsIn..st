magma-collections
updateLargeCollectionsIn: aMaCommitPackage recordResultsIn: aMaCommitResult
	"The repositoryControllers sessions view of the repository must be completely refreshed, it must know about all new collections."

	aMaCommitPackage allLargeCollectionChangesDo:
		[ : each |
		each isNewCollection
			ifTrue:
				[ | permanentOid mc |
				permanentOid := aMaCommitResult permanentOids at: each collectionOid ifAbsent: [ MagmaSoftwareError signal: 'expected to find permanent oid for new collection ', each collectionOid printString ].
				each collectionOid: permanentOid.
				mc := 
					self session 
						objectWithOid: each collectionOid 
						ifAbsent:
							[ MagmaSoftwareError signal: 'expected to know about MagmaCollection ', each collectionOid, ' here.' ].
				(self ensureManagerCreatedFor: mc) 	createNewLargeCollection ].
		each hasAddedIndexes 
			ifTrue:
				[ (self collectionManagerFor: each collectionOid) createSupplementaryIndexes ] ].
	aMaCommitPackage allLargeCollectionChangesDo:
		[ :each |
		(self collectionManagerFor: each collectionOid)
			process: each
			recordResultsIn: aMaCommitResult ]