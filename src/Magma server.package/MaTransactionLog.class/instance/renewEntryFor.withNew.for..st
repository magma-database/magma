actions
renewEntryFor: sessionUuid withNew: entryClass for: aMaObjectRepository 
	"Gives the session identified by sessionUuid a new TranslactionLogEntry, where its challengers will be accumulated.  The entry prior to replacement is answered."
	| entry |
	entry := self 
		renewEntryFor: sessionUuid
		withNew: entryClass
		ifAbsent: [ MagmaSessionLost signal ].
	aMaObjectRepository 
		renewServerNotificationsIn: entry result
		from: entry.
	entry result
		commitNumber: aMaObjectRepository commitNumber ;
		oidCount: aMaObjectRepository oidCount.
	^ entry