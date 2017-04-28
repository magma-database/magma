other squeak images
readyAt: portInteger 
	| socket |
	^ 
	[ socket := Socket newTCP 
		connectTo: NetNameResolver localHostAddress
		port: portInteger
		waitForConnectionFor: 5.
	socket closeAndDestroy.
	true ] 
		on: ConnectionTimedOut
		do: 
			[ : err | 
			MaArmoredCodeNotification signal: 'Could not connect to port ' , portInteger asString , '.'.
			false ]