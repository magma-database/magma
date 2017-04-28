testing
isReady
	| socket |
	^ 
	[ socket := Socket newTCP 
		connectTo: NetNameResolver localHostAddress
		port: link port
		waitForConnectionFor: 5.
	socket closeAndDestroy.
	true ] 
		on: ConnectionTimedOut
		do: 
			[ : err | 
			MaArmoredCodeNotification signal: 'Could not connect to port, waiting...' , link port asString , '.'.
			false ]