signaling
signalSetRetrySeconds: anInteger
	self 
		signal: 'setting retrySeconds to ', anInteger
		do: [ :session | session retrySeconds: anInteger ]