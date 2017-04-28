create
serverSocket: aMaServerSocket lifecycle: aMaServerRequestLifecycle 
	^ self new
		serverSocket: aMaServerSocket ;
		lifecycle: aMaServerRequestLifecycle ;
		yourself