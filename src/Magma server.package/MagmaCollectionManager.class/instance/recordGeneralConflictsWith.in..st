private
recordGeneralConflictsWith: aMagmaLargeCollectionChanges in: aMaCommitLogEntry

	"If its locked by someone else, no changes are allowed."
	(self isLocked
	and: [ aMaCommitLogEntry connection sessionId ~= lockedBy sessionId ])
		ifTrue:
			[ aMaCommitLogEntry
				failResultWith: self lockedBy
				on: aMagmaLargeCollectionChanges collectionOid ]