actions
renewTransactionEntryFor: sessionUuid repository: aMaObjectRepository 
	^ (self 
		renewEntryFor: sessionUuid
		withNew: (self entryFor: sessionUuid) class
		for: aMaObjectRepository) result