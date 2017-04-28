private
renewEntryFor: sessionUuid withNew: aClass ifAbsent: aBlock
	"aClass should be either MaTransactionLogEntry or MaCommitLogEntry"

	| entry |
	entry :=
		(self
			removeEntryForSessionId: sessionUuid
			ifAbsent: [ ^ aBlock value ]).
	entry recordAllChangedObjects.
	entries add: 
		(aClass
			id: sessionUuid
			connection: entry result connection).
	^ entry