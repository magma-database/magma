building
newTransactionFor: sessionUuid repository: aMaObjectRepository 
	^ (self 
		renewEntryFor: sessionUuid
		withNew: MaCommitLogEntry
		for: aMaObjectRepository) result