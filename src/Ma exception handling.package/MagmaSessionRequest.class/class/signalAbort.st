signaling
signalAbort

	self 
		signal: 'aborting transaction'
		do: [ :session | session abort ]