*ma client server
maPrimConnectTo: addressByteArray 
	self 
		primSocket: socketHandle
		connectTo: addressByteArray
		port: self port