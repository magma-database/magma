private
receiveInto: aByteArray 
	"First, we receive into *my* byteArray, then I paste it into aByteArray."
	| bytesExpected bytesReceived answer startedWaitingForResponse startedReceivingResponse timeToReceiveResponse compressed |
	bytesReceived := 0.
	bytesExpected := nil.
	"We track two separate timing stats from this method, first the #timeWaitingForResponsesHistory is the time to receive the *initial bytes* of the response.  Second, the #timeReceivingResponsesHistory measures the time to actually *download* the response bytes, calculated by subtracting the value last recorded in the timeWaitingForResponsesHistory."
	startedReceivingResponse := Time millisecondClockValue.
	[ bytesExpected isNil or: [ bytesReceived < bytesExpected ] ] whileTrue: 
		[ startedWaitingForResponse ifNil: [ startedWaitingForResponse := Time millisecondClockValue ].
		[ socket waitForDataFor: self timeoutSeconds.
		startedWaitingForResponse isInteger ifTrue: 
			[ stat timeWaitingForResponsesHistory addValue: (Time millisecondsSince: startedWaitingForResponse).
			startedWaitingForResponse := 'initial wait captured.'	"Deactivate it now by setting it to this string." ].
		
		bytesReceived := bytesReceived + (socket 
				receiveSomeDataInto: byteArray
				startingAt: bytesReceived + 1) ] 
			on: Error
			do: 
				[ : err | 
				self disconnect.
				err messageText = 'a primitive has failed' 
					ifTrue: 
						[ err resignalAs: 
							(NetworkError new
								messageText: 'Network failure while receiving response.' ;
								yourself) ]
					ifFalse: [ err pass ] ].
		bytesExpected ifNil: 
			[ bytesReceived >= self headerSize ifTrue: 
				[ bytesExpected := byteArray 
					maUint: 32
					at: 0.
				compressed := self isCompressedBitSet: bytesExpected.
				bytesExpected := bytesExpected maBitClear: 32.
				self ensureByteArrayCanHold: bytesExpected ] ] ].
	"I think it's safe to assume here that the stats will be active."
	timeToReceiveResponse := (Time millisecondsSince: startedReceivingResponse) - stat timeWaitingForResponsesHistory last.
	stat timeReceivingResponsesHistory addValue: timeToReceiveResponse.
	"We should now have the full buffer in my byteArray, paste it into the answer ByteArray."
	stat timeToLoadBuffersHistory addValue: (Time millisecondsToRun: 
			[ answer := bytesReceived - self headerSize > aByteArray size 
				ifTrue: [ ByteArray new: bytesReceived - self headerSize ]
				ifFalse: [ aByteArray ].
			answer 
				replaceFrom: 1
				to: bytesReceived - self headerSize
				with: byteArray
				startingAt: self headerSize + 1 ]).
	^ compressed 
		ifTrue: [ answer lzUncompressed ]
		ifFalse: [ answer ]