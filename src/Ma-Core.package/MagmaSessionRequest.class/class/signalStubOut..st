signaling
signalStubOut: anObject 
	self 
		signal: 'stub out'
		do: [ : session | session stubOut: anObject ]