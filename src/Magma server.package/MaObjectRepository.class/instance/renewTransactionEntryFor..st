client-requests
renewTransactionEntryFor: sessionId 
	^ transactionLog 
		renewTransactionEntryFor: sessionId
		repository: self