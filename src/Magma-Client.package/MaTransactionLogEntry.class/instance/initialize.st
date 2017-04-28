initialize-release
initialize
	"of MaTransactionLogEntries or MaCommitLogEntries that challenge me."
	super initialize.
	self
		initializeResult ;
		initializeChallengers ;
		initializeServerNotifications