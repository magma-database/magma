signaling
signalClean
	self 
		signal: 'cleaning session'
		do: [ :session | session clean ]