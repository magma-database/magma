signaling
signalSetTimeoutSeconds: anInteger
	self 
		signal: 'setting timeout to ', anInteger, ' seconds'
		do: [ :session | session timeoutSeconds: anInteger ]