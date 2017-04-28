initialize-release
socket: aSocket
	socket := aSocket.
	socketStream := (SocketStream on: aSocket) binary; autoFlush: false.
	socketQueueTime := Time millisecondClockValue.
	remoteAddress := aSocket remoteAddress.
	remotePort := aSocket remotePort