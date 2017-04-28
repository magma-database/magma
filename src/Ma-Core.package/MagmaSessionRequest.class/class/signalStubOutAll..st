signaling
signalStubOutAll: aCollection 
	self 
		signal: 'stub out ', aCollection size, ' objects.'
		do: [ : session | session stubOutAll: aCollection ]