private
send: anInteger 
	| startedSending |
	(anInteger > MaClientSocket mtuSize and: [ self isUdp ]) ifTrue: 
		[ MaClientServerUserError signal: '#udp transmissions should be less than ', MaClientSocket mtuSize, ' bytes' ].
	self ensureConnected.
	startedSending := Time millisecondClockValue.
	self isUdp 
		ifTrue: 
			[ socket 
				sendUDPData: byteArray
				toHost: self hostAddress
				port: self port ]
		ifFalse: 
			[ socket 
				sendData: byteArray
				count: anInteger.
			socket waitForSendDoneFor: self timeoutSeconds.
			socket sendDone ifFalse: 
				[ NetworkError signal: 'Connection to ' , self hostAndPortString , ' lost.' ] ].
	"Only include successful sends to measure real network performance, not timeouts perhaps due to user-error."
	stat timeToSendRequestsHistory addValue: (Time millisecondsSince: startedSending)