A MaTransactionLogEntry maintains information about a single MagmaSession client's refresh state.

Instance Variables
	challengingEntries:  an OrderedCollection of aMaCommitLogEntry's submitted by other clients.  The next time my client commits, none of the committed objects can be included in any of the other MaCommitLogEntry.  Additionally, all of each other MaCommitLogEntry's #committed objects will need to be refreshed by my client.

	id:  anInteger identifying my client-session.

	needsToRefresh:  When my client performs a read operation, this boolean is also included to indicate whether it should perform an abort.  (Note:  This may be soon optimised out).

	result:  My MaRefreshViewResult or MaCommitResult.

	serverNotifications:  A Dictionary of the notifications that my client should respond to.
