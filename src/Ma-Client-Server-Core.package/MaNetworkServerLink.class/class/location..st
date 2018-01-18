creation
location: aMaServerLocation 
	^ self new
		socket: (MaClientSocket location: aMaServerLocation) ;
		yourself