test UDP object server
sendObjectsToUdpServer: aCollection 
	| myLink |
	myLink := MaNetworkServerLink location: (MaServerLocation 
			host: (self class getHostNameFor: 'server')
			port: self class defaultServerPort).
	myLink
		networkProtocol: #udp ;
		protocol: self testServerObjectProtocol.
	[ self noteBusyWhile: [ aCollection do: [ : each | myLink submit: each ] ] ] fork