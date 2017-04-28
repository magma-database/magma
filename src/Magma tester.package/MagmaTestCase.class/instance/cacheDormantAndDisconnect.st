test refreshAll
cacheDormantAndDisconnect
	clientSession abort.
	dormantObject := clientSession root at: #testRefreshAll.
	"Ensure not proxies."
	dormantObject do: [ : e | e printString ].
	clientSession disconnect