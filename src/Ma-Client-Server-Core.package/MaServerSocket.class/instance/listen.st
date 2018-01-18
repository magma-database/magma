private
listen
	"By using this method, I will call my servers #processRequestByteArray:.  If you don't want to have a MaServer class, use listenOn:answer:."
	running ifTrue: [ MaClientServerUserError signal: 'socket already listening.' ].
	running := true.
	ActiveSockets add: self.
	console note: 'creating server socket'.
	self isUdp
		ifTrue:
			[ socket := Socket newUDP
				setPort: port
				interface: interface ]
		ifFalse:
			[ socket := Socket newTCP.
			socket
				listenOn: port
				backlogSize: 50
				interface: interface ].
	socket isValid ifFalse: [ NetworkError signal: 'Socket accept() not supported.' ].
	socket port = port ifFalse:
		[ self shutdown.
		MaClientServerEnvironmentError signal: 'Port ' , port asString , ' could not be allocated.' ].
	console
		 note: 'now listening on ' , port printString ;
		 noteAboutToStart.
	self isUdp
		ifTrue:
			[ | lifecycle |
			lifecycle := MaServerRequestLifecycle socket: socket.
			lifecycle socketStream timeout: self timeoutSeconds.
			clientConnections add:
				(MaClientConnection
					serverSocket: self
					lifecycle: lifecycle) monitorForUdpByteArrayRequests ]
		ifFalse:
			[ self
				 startAcceptingRequests ;
				 startExtractingRequests ].
	self startProcessingRequests.
	console noteJustStarted