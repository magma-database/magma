private
initialize
	"of MaTransactionLogEntries or MaCommitLogEntries that challenge me."
	super initialize.
	self
		initializeChallengers ;
		initializeResult ;
		initializeServerNotifications