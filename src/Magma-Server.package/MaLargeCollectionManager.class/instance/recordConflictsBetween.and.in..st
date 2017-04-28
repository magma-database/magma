override
recordConflictsBetween: aMagmaCollectionChanges and: challengingCommitLogEntry in: myCommitLogEntry
	"If there are any conflicts, record them in myCommitLogEntry."

	self subclassResponsibility