client-requests
abortTransactionFor: sessionId

	^ transactionLog 
		abortTransactionEntryFor: sessionId
		repository: self