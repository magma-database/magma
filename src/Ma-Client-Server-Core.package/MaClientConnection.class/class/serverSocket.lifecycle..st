create
serverSocket: aMaServerSocket lifecycle: aMaServerRequestLifecycle 
	^ self new
		setServerSocket: aMaServerSocket 
		lifecycle: aMaServerRequestLifecycle ;
		yourself