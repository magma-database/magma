building
determineResultFor: aMaCommitPackage using: aMaObjectRepository 
	self
		recordLargeCollectionConflictsWith: aMaCommitPackage
			using: aMaObjectRepository ;
		recordObjectConflictsIn: aMaCommitPackage.
	^ result