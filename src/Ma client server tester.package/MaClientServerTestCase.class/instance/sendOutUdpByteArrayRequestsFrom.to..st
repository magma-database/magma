test UDP ByteArray server
sendOutUdpByteArrayRequestsFrom: start to: stop 
	"Send the server the numbers, in English words, from 500 to 1000."
	| bag mySocket |
	bag := self 
		newBagFrom: start
		to: stop.
	mySocket := MaClientSocket location: (MaServerLocation 
			host: (self class getHostNameFor: 'server')
			port: self class defaultServerPort).
	mySocket networkProtocol: #udp.
	[ busy := true.
	bag do: 
		[ : each | 
		mySocket 
			sendData: each
			startingAt: 2
			count: each size - 2
			waitForReplyIn: nil
		"		(Delay forMilliseconds: 10 atRandom) wait" ].
	busy := false ] fork