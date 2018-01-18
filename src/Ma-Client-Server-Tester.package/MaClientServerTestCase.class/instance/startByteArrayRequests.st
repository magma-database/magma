test ByteArray server
startByteArrayRequests
	| mySocket requestByteArray response eachResponse randomStream byteArrayRandomizer requestSize largestTest |
	largestTest := 9000.
	randomStream := Random new.
	response := ByteArray new: 4000.	"<- purposely too small"
	requestByteArray := ByteArray new: largestTest.
	byteArrayRandomizer := 
	[ : size | 
	1 
		to: size
		do: 
			[ : index | 
			requestByteArray 
				at: index
				put: (randomStream nextInt: 256) - 1 ] ].
	mySocket := MaClientSocket location: 
		(MaServerLocation 
			host: NetNameResolver localHostName
			port: self class defaultServerPort).
	
	[ busy := true.
	1 
		to: 200
		do: 
			[ : count | 
			requestSize := randomStream nextInt: largestTest.
			byteArrayRandomizer value: requestSize.
			eachResponse := mySocket 
				sendData: requestByteArray
				startingAt: 1
				count: requestSize
				waitForReplyIn: response.
			self should: 
				[ (requestByteArray 
					copyFrom: 1
					to: requestSize) reverse = (eachResponse 
						copyFrom: 1
						to: requestSize) ] ].
	busy := false ] fork