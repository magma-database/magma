test object server
startObjectServer
	server := MaNetworkRequestServer protocol: self testServerObjectProtocol.
	server 
		processOn: self class defaultServerPort
		using: self objectProcessorBlock