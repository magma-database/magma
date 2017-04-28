private
listen
	"By using this method, I will call my servers #processRequestByteArray:.  If you don't want to have a MaServer class, use listenOn:answer:."
	running ifTrue: [ MaClientServerUserError signal: 'socket already listening.' ].
	running := true.
	ActiveSockets add: self.
	server note: 'creating server socket'.
	self isUdp 
		ifTrue: 
			[ socket := Socket newUDP
				setPort: port ;
				maPrimConnectTo: interface yourself ]
		ifFalse: 
			[ socket := Socket newTCP.
			socket 
				listenOn: port
				backlogSize: 50
				interface: interface ].
	socket isValid ifFalse: [ NetworkError signal: 'Socket accept() not supported.' ].
	server
		note: 'now listening on ' , port printString ;
		noteAboutToStart.
	self isUdp 
		ifTrue: 
			[ clientConnections add: (MaClientConnection 
					serverSocket: self
					lifecycle: (MaServerRequestLifecycle socket: socket)) monitorForUdpByteArrayRequests ]
		ifFalse: 
			[ self
				startAcceptingRequests ;
				startExtractingRequests ].
	self startProcessingRequests.
	server noteJustStarted