signaling
signalCommit

	self 
		signal: 'committing transaction'
		do: [ :session | session commit ]