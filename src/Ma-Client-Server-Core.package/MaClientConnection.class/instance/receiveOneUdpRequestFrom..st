private
receiveOneUdpRequestFrom: aMaRequestLifecycle 
	"Wait up to 3 seconds for something from any UDP client.  If data is received from aMaRequestLifecycle's socket, answer it, otherwise nil."
	| bytesExpected bytesReceived compressed receiveArray answer |
	bytesReceived := 0.
	bytesExpected := nil.
	aMaRequestLifecycle socket
		waitForDataFor: 3
		ifClosed: 
			[ ConnectionClosed signal: 'Connection closed while waiting for data.' ]
		ifTimedOut: 
			[ "no data, just fall out"
			 ].
	^ aMaRequestLifecycle socket dataAvailable ifTrue: 
		[ answer := ByteArray new: MaClientSocket mtuSize.
		receiveArray := aMaRequestLifecycle socket receiveUDPDataInto: answer.
		bytesReceived := receiveArray first.
		bytesReceived > serverSocket headerSize ifTrue: 
			[ bytesExpected := answer maUnsigned32At: 1.
			compressed := bytesExpected maIsBitSet: 32.
			bytesExpected := bytesExpected maBitClear: 32.
			bytesExpected > MaClientSocket mtuSize ifTrue: [ ^ nil ].
			self console noteTimeToLoadBuffers: 
				(Time millisecondsToRun: 
					[ answer := answer 
						copyFrom: serverSocket headerSize + 1
						to: bytesExpected.
					compressed ifTrue: [ answer := answer lzUncompressed ] ]).
			answer ] ]