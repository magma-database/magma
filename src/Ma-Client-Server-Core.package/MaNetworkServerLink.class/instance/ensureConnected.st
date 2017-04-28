connections
ensureConnected
	submitGuard critical:
		[ self isConnected ifFalse: [ self connect ] ]