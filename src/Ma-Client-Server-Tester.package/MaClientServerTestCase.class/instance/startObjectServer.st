test object server
startObjectServer
	server := MaNetworkRequestServer protocol: self objectProtocolForTestServer.
	server 
		processOn: self class defaultServerPort
		using: self objectProcessorBlock