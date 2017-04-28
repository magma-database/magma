actions
abortTransactionEntryFor: sessionIdInteger repository: aMaObjectRepository 
	^ (self 
		renewEntryFor: sessionIdInteger
		withNew: MaTransactionLogEntry
		for: aMaObjectRepository) result