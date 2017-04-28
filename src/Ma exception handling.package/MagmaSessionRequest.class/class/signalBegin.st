signaling
signalBegin

	self 
		signal: 'beginning transaction'
		do: [ :session | session begin ]