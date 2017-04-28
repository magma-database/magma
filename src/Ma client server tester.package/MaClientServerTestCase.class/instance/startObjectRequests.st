test object server
startObjectRequests
	| myLink |
	myLink := MaNetworkServerLink location: 
		(MaServerLocation 
			host: (self class getHostNameFor: 'server')
			port: self class defaultServerPort
"			interface: #udp").
	[ busy := true.
	200 timesRepeat: 
		[ | eachRequest myResponse remoteResponse |
		eachRequest := MacsTestRequest new.
		remoteResponse := myLink submit: eachRequest.
		myResponse := self objectProcessorBlock value: eachRequest.
		self assert: [ remoteResponse ~~ myResponse ].
		self should: [ remoteResponse response1 = myResponse response1 ].
		self should: [ remoteResponse response2 = myResponse response2 ] ].
	busy := false ] fork