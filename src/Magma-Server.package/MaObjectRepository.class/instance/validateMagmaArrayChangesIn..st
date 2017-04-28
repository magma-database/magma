magma-collections
validateMagmaArrayChangesIn: aMaCommitLogEntry 
	aMaCommitLogEntry commitPackage allLargeCollectionChanges do: [ : each | each validate ]