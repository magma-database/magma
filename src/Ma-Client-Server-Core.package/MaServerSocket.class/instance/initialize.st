initialize-release
initialize
	super initialize.
	running := false.
	self initializeQueues.
	clientConnections := OrderedCollection new.
	clientConnectionsGuard := Mutex new.
	preferences := MaClientServerPreferences new
		compressThreshold: MaSerializedGraphBuffer unreasonablePhysicalSize * 2 ;
		yourself.
	networkProtocol := #tcp.
	interface := NetNameResolver addressFromString: '0.0.0.0'