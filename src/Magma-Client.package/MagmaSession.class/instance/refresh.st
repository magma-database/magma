transactions
refresh
	"Update the state of all persistent objects known to by this session with changes by other sessions, without changing the status of the transaction."
	"Calls #renewTransactionEntryFor:."
	[ self safeRefresh ]
		on: MagmaTooFarBehindConflict
		do: [ : err | err retry ]