historys
refreshViewHistory
	"The time required to refresh the clients view of the repository.  This is ONLY the time spent on the client-side, it does not include the time waiting for the server to process the associated begin, commit or abort request.  For those times, see timeToSubmitHistoryFor: MaWriteRequest, MaTransactionRequest or MaAbortTransactionRequest."
	^refreshViewHistory