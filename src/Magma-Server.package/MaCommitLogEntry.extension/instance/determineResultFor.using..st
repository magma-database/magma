*magma-server
determineResultFor: aMaCommitPackage using: aMaObjectRepository 
	self
		
		recordLargeCollectionConflictsWith: aMaCommitPackage
		using: aMaObjectRepository ;
		
		recordObjectConflictsIn: aMaCommitPackage
		using: aMaObjectRepository.
	^ result