overriding
process: aMaCollectionChanges recordResultsIn: aMaCommitResult

	self
		processLockIn: aMaCollectionChanges
		using: aMaCommitResult connection.
	self processRemovedIndexesIn: aMaCollectionChanges.
	self
		processAddsIn: aMaCollectionChanges
		using: aMaCommitResult.
	self
		processRemovesIn: aMaCollectionChanges;
		processChangedIndexValuesIn: aMaCollectionChanges;
		processAddNewIndexValuesIn: aMaCollectionChanges