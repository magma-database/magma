send
sendData: requestByteArray startingAt: startIndex count: numberOfBytes waitForReplyIn: answerByteArray 
	"Perform a synchronous TCP call, sending count bytes of requestByteArray from position startIndex to my peer socket and then wait up to my timeout period for a reply, which I'll put in answerByteArray.  If I run out of room in answerByteArray, I'll create you a new one and return it, otherwise you'll get your own answerByteArray back.  If communications are disrupted, I'll signal a NetworkError."
	"Do a retry logic to help with the case where the server has dropped only momentarily.  Sockets will be invalid but, unfortunately, they don't always correctly report they are invalid, as if they don't 'realize' it yet."
	| tries |
	sequenceNumber:=sequenceNumber+1.
	tries := 0.
	[ | startedSending header toSend compressed totalToSend |
	(numberOfBytes > MaClientSocket mtuSize and: [ self isUdp ]) ifTrue: [ MaClientServerUserError signal: '#udp transmissions should be less than ' , MaClientSocket mtuSize-self headerSize , ' bytes' ].
	startedSending := Time millisecondClockValue.
	self ensureConnected.
	totalToSend := numberOfBytes + self headerSize.
	toSend := requestByteArray size > self compressThreshold
		ifTrue:
			[ compressed := (requestByteArray
				copyFrom: startIndex
				to: startIndex + numberOfBytes - 1) lzCompressed.
			compressed size < numberOfBytes
				ifTrue: [ compressed ]
				ifFalse:
					[ compressed := nil.
					requestByteArray ] ]
		ifFalse: [ requestByteArray ].
	header := self sequenceNumber: sequenceNumber totalToSend: totalToSend compressed: compressed notNil.
	self isUdp
		ifTrue:
			[ socket
				sendUDPData:
					(compressed
						ifNil:
							[ header, (toSend
								copyFrom: startIndex
								to: startIndex + numberOfBytes - 1) ]
						ifNotNil: [ header, toSend ])
				toHost: self hostAddress
				port: self port ]
		ifFalse:
			[ socketStream nextPutAll: header.
			compressed
				ifNil:
					[ socketStream
						next: numberOfBytes
						putAll: toSend
						startingAt: startIndex ]
				ifNotNil: [ socketStream nextPutAll: toSend ].
			socketStream flush.
			socket waitForSendDoneFor: self timeoutSeconds ].
	"Only include successful sends to measure real network performance, not timeouts perhaps due to user-error."
	stat timeToSendRequestsHistory addValue: (Time millisecondsSince: startedSending) ]
		on: Error
		do:
			[ : sendErr | self disconnect.
			"Handle a specific bug in Squeak, arrggghh!"
			(sendErr messageText = 'a primitive has failed' or: [ sendErr isKindOf: NetworkError ])
				ifTrue:
					[ tries < 3
						ifTrue:
							[ tries := tries + 1.
							sendErr retry ]
						ifFalse: [ sendErr pass ] ]
				ifFalse: [ sendErr pass ] ].
	"Retry logic is not appropriate on the receive side."
	^ answerByteArray ifNotNil:
		[ self isUdp ifFalse: [ self receiveInto: answerByteArray ] ]