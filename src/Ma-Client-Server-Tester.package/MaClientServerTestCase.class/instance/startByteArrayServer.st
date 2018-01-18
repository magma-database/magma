test ByteArray server
startByteArrayServer
	server := MaServerSocket new.
	server 
		processOn: self class defaultServerPort
		using: [ : requestLifecycle | requestLifecycle requestByteArray reverse ]