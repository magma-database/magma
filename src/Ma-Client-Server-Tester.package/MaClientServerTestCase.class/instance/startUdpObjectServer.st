test UDP object server
startUdpObjectServer
	server := MaNetworkRequestServer protocol: self objectProtocolForTestServer.
	server networkProtocol: #udp.
	testObjects := Bag new.
	server 
		processOn: self class defaultServerPort
		using: [ : eachMacsTestRequest | testObjects add: eachMacsTestRequest ]