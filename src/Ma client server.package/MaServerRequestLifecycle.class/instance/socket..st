initialize-release
socket: aSocket 
	socket := aSocket.
	socketQueueTime := Time millisecondClockValue.
	remoteAddress := socket remoteAddress.
	remotePort := socket remotePort