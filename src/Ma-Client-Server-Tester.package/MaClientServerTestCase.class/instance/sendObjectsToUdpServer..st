test UDP object server
sendObjectsToUdpServer: aCollection 
	| myLink |
	myLink := MaNetworkServerLink location:
		(MaServerLocation
			host: NetNameResolver localHostName
			port: self class defaultServerPort).
	myLink
		 networkProtocol: #udp ;
		 protocol: self objectProtocolForTestServer.
	[ self noteBusyWhile:
		[ aCollection do:
			[ : each | myLink submit: each ] ] ] fork