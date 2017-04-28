building
newTransactionFor: sessionUuid 
	(transactionLog entryFor: sessionUuid) isCommitEntry ifTrue: [ MagmaAlreadyInTransaction signal: 'Already in a transaction.' ].
	^ transactionLog 
		newTransactionFor: sessionUuid
		repository: self