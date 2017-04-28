initialize-release
setServerSocket: aMaServerSocket lifecycle: aMaServerRequestLifecycle 
	serverSocket := aMaServerSocket.
	lifecycle := aMaServerRequestLifecycle.
	lifecycle clientConnection: self