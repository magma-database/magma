client-requests
submitAll: aMaCommitPackage for: sessionId beginAnother: aBoolean 
	"Save all of the serialized objects in aMaCommitPackage to the repository.
	If any of the objects in aMaCommitPackage have been changed by other transactions, signal a commit failure."
	| entry |
	self restoreMode ifTrue: 
		[ MagmaUserError signal: 'Commits are not allowed because this repository is in restoreMode.' ].
	entry := transactionLog 
		renewEntryFor: sessionId
		withNew: (aBoolean 
				ifTrue: [ MaCommitLogEntry ]
				ifFalse: [ MaTransactionLogEntry ])
		for: self.
	entry isCommitEntry ifFalse: 
		[ (MagmaNoTransactionError result: entry result) signal: 'No commit-entry on server.' ].
	entry
		determineResultFor: aMaCommitPackage
			using: self ;
		initializeChallengers.
	"No need for these challengers anymore, delete them, save memory."
	entry result hasConflicts 
		ifTrue: 
			[ (MagmaCommitConflictError result: entry result ) signal ]
		ifFalse: 
			[ entry commitPackage: aMaCommitPackage.
			self write: entry ].
	(sessionId ~= repositoryController sessionId and: [ transactionLog isFirstEntryFor: repositoryController sessionId ]) ifTrue: [ repositoryController refreshView ].
	^ entry result