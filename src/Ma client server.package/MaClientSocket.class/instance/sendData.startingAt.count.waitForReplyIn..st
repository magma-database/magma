send
sendData: requestByteArray startingAt: startIndex count: numberOfBytes waitForReplyIn: answerByteArray 
	"Perform a synchronous TCP call, sending count bytes of requestByteArray from position startIndex to my peer socket and then wait up to my timeout period for a reply, which I'll put in answerByteArray.  If I run out of room in answerByteArray, I'll create you a new one and return it, otherwise you'll get your own answerByteArray back.  If communications are disrupted, I'll signal a NetworkError."
	| tries bytesToSend |
	stat timeToLoadBuffersHistory addValue: (Time millisecondsToRun: 
			[ bytesToSend := self 
				loadByteArrayWith: requestByteArray
				startingAt: startIndex
				count: numberOfBytes ]).
	"Do a retry logic to help with the case where the server has dropped only momentarily.  Sockets will be invalid but, unfortunately, they don't always correctly report they are invalid, as if they don't 'realize' it yet."
	tries := 0.
	[ self send: bytesToSend ] 
		on: Error
		do: 
			[ : sendErr | 
			self disconnect.
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
	^ answerByteArray ifNotNil: [ self isUdp ifFalse: [ self receiveInto: answerByteArray ] ]