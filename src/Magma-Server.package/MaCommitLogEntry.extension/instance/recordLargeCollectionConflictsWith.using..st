*magma-server
recordLargeCollectionConflictsWith: aMaCommitPackage using: aMaObjectRepository 
	aMaCommitPackage allLargeCollectionChangesDo: 
		[ : eachChanges | 
		eachChanges isNewCollection ifFalse: 
			[ | collectionManager |
			collectionManager := aMaObjectRepository collectionManagerFor: eachChanges collectionOid.
			collectionManager 
				recordGeneralConflictsWith: eachChanges
				in: self.
			challengingEntries do: 
				[ : eachEntry | 
				collectionManager 
					recordConflictsBetween: eachChanges
					and: eachEntry
					in: self ] ] ]