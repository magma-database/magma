signaling
signalDisconnect
	self 
		signal: 'disconnecting session'
		do: [ :session | session disconnect ]