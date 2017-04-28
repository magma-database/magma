output
showSocket: aSocket 
	Transcript show: (NetNameResolver stringFromAddress: aSocket remoteAddress)