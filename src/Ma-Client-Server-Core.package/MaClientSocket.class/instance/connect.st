private
connect
	| startTryingToConnectSocket |
	Socket initializeNetwork.
	socket 
		ifNotNil: 
			[ MaSoftwareError signal: 'client trying to make multiple connects?' ]
		ifNil: 
			[ self isUdp 
				ifTrue: 
					[ "Do NOT set the port now or it will not work.  It is specified on every send call."
					socket := Socket newUDP ]
				ifFalse: 
					[ | hostAddr |
					socket := Socket newTCP.
					startTryingToConnectSocket := Time millisecondClockValue.
					hostAddr := self hostAddress ifNil: [ NetworkError signal: 'Could not resolve ' , self location host ].
					socket 
						connectTo: hostAddr
						port: self port
						waitForConnectionFor: self timeoutSeconds.
					socketStream := (SocketStream on: socket) binary; autoFlush: false; timeout: self timeoutSeconds.
					self resetSequenceNumber.
					stat ensureActive timeToConnectSocketHistory addValue: (Time millisecondsSince: startTryingToConnectSocket) ] ]