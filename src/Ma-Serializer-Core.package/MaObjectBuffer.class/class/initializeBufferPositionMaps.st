initializing
initializeBufferPositionMaps
	BufferPositionMaps := Array new: 16.
	self 
		bpMapsAt: 1
		put: self defaultBpMap