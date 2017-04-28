accessing
changedObjects

	| preservedCommitPackage answer |
	"this method must be non-destructive to the my commitPackage because it may be requested again."
	preservedCommitPackage := commitPackage copyWithNewLargeCollectionChanges.  "It should actually be ok to share its 'objects'."
	self
		addChangesFromReadSet ;  "another potential truncation warning"
		recordPotentialKeyChanges ;
		addLargeCollectionChangesTo: commitPackage.
	answer := commitPackage.
	commitPackage := preservedCommitPackage.
	^ answer