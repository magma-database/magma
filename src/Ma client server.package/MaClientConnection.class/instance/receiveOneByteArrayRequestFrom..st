private
receiveOneByteArrayRequestFrom: aMaRequestLifecycle 
	"Wait up to 3 seconds for something from the client.  If data is received from aMaRequestLifecycle's socket be sure the entire data is received.  Otherwise answer nil."
	| bytesExpected bytesReceived answer firstDataReceived compressed |
	bytesReceived := 0.
	bytesExpected := nil.
	answer := ByteArray new: 80.
	[ bytesExpected isNil or: [ bytesReceived < bytesExpected ] ] whileTrue: 
		[ aMaRequestLifecycle socket 
			waitForDataFor: 3 "seconds so server can respond to shutdown within 5 seconds total."
			ifClosed: 
				[ ConnectionClosed signal: 'Connection closed while waiting for data.' ]
			ifTimedOut: 
				[ "no data, just fall out"
				 ].
		aMaRequestLifecycle socket dataAvailable ifFalse: 
			[ "This logic means, if data starts to be received, each chunk must be received within 3 seconds or else it will timeout."
			bytesReceived = 0 
				ifTrue: [ ^ nil ]
				ifFalse: 
					[ ConnectionTimedOut signal: 'data not available from ' , (serverSocket hostAndPortStringFor: aMaRequestLifecycle socket) ] ].
		firstDataReceived := Time millisecondClockValue.
		bytesReceived := bytesReceived + (aMaRequestLifecycle socket 
				receiveSomeDataInto: answer
				startingAt: bytesReceived + 1).
		bytesExpected ifNil: 
			[ bytesReceived >= serverSocket headerSize ifTrue: 
				[ bytesExpected := answer 
					maUint: 32
					at: 0.
				compressed := self isCompressedBitSet: bytesExpected.
				bytesExpected := bytesExpected maBitClear: 32.
				bytesExpected > MaSerializedGraphBuffer unreasonablePhysicalSize ifTrue: [ MaMalformedRequestError signal: 'unreasonable request size' ].
				answer := self 
					ensureByteArray: answer
					canHold: bytesExpected ] ] ].
	bytesReceived = bytesExpected ifFalse: 
		[ NetworkError signal: 'Unexpected client behavior, more bytes received than client stated sending.' ].
	self server noteTimeToExtractRequestBytes: (Time millisecondsSince: firstDataReceived).
	self server noteTimeToLoadBuffers: (Time millisecondsToRun: 
			[ answer := answer 
				copyFrom: serverSocket headerSize + 1
				to: bytesExpected.
			compressed ifTrue: [ answer := answer lzUncompressed ] ]).
	^ answer