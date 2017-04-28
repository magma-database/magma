initializing
initialize
	HasMagma:=true.
	self disconnectAndCloseAllConnectedSessions.
	ConnectedSessions := OrderedCollection new.
	Smalltalk addToShutDownList: self.
	MaObjectBuffer 
		bpMapsAt: MagmaBufferPositionMap indexPosition + 1
		put: MagmaBufferPositionMap