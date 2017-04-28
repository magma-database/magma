signaling
signalNewGlobalReadStrategy: aMaReadStrategy
	self 
		signal: 'setting global read-strategy'
		do: [ :session | session globalReadStrategy: aMaReadStrategy ]