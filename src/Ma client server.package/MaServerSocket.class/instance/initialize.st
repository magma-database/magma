initialize-release
initialize
	super initialize.
	running := false.
	self initializeQueues.
	self server: MaServer new.	"use the do-nothing server by default"
	doBlock := [ : lifecycle | server processRequestByteArray: lifecycle ].
	clientConnections := OrderedCollection new.
	clientConnectionsGuard := Mutex new.
	preferences := MaClientServerPreferences new
		compressThreshold: MaSerializedGraphBuffer unreasonablePhysicalSize * 2 ;
		yourself.
	networkProtocol := #tcp.
	interface := NetNameResolver addressFromString: '0.0.0.0'