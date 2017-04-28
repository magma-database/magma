test UDP ByteArray server
startUdpByteArrayServer
	server := MaServerSocket new
		networkProtocol: #udp ;
		yourself.
	"Server will load this Bag."
	mergedBag := Bag new.
	server 
		processOn: self class defaultServerPort
		using: [ : requestLifecycle | mergedBag add: requestLifecycle requestByteArray asString ]