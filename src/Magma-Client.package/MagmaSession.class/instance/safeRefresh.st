transactions
safeRefresh
	"Update the state of all persistent objects known to by this session with changes by other sessions, without changing the status of the transaction."
	"Calls #renewTransactionEntryFor:."
	guard critical: 
		[ self 
			refreshViewUsing: (self submit: MaRefreshRequest new)
			includingLocal: false ]