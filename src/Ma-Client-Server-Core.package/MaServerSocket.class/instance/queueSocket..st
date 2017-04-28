private
queueSocket: aSocket
	| lifecycle | lifecycle := MaServerRequestLifecycle socket: aSocket.
	socketQueue nextPut: lifecycle.
	lifecycle socketStream timeout: self timeoutSeconds.
	console noteSocketsQueued: socketQueue size