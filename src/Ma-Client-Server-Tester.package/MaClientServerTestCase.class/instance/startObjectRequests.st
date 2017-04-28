test object server
startObjectRequests
	| myLink |
	myLink := MaNetworkServerLink location:
		(MaServerLocation
			host: NetNameResolver localHostName
			port: self class defaultServerPort).
	"			interface: #udp"
	[ busy := true.
	200 timesRepeat:
		[ | eachRequest myResponse remoteResponse |
		eachRequest := MacsTestRequest new.
		remoteResponse := myLink submit: eachRequest.
		myResponse := self objectProcessorBlock value: eachRequest.
		self
			 assert: remoteResponse ~~ myResponse ;
			 assert: remoteResponse response1 = myResponse response1 ;
			 assert: remoteResponse response2 = myResponse response2 ].
	busy := false ] fork