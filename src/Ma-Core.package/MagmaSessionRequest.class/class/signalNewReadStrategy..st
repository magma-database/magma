signaling
signalNewReadStrategy: aMaReadStrategy
	self 
		signal: 'setting read-strategy'
		do: [ :session | session readStrategy: aMaReadStrategy ]