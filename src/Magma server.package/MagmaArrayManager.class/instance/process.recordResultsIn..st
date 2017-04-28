actions
process: aMaCollectionChanges recordResultsIn: aMaCommitResult

	self
		processAddsIn: aMaCollectionChanges
		using: aMaCommitResult.