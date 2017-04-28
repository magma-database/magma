private
receiveOneByteArrayRequestFrom: aMaRequestLifecycle 
	"Wait up to 3 seconds for something from the client.  If data is received from aMaRequestLifecycle's socket be sure the entire data is received.  Otherwise answer nil."
	| header bytesExpected incomingSequenceNumber answer firstDataReceived compressed priorTimeout |
	bytesExpected := nil.
	priorTimeout := aMaRequestLifecycle socketStream timeout.
	[ aMaRequestLifecycle socketStream timeout: 3.
	header := aMaRequestLifecycle socketStream next: 8.
	aMaRequestLifecycle socketStream timeout: priorTimeout ]
		on: ConnectionTimedOut
		do: [ : err | ^ nil ].
	firstDataReceived := Time millisecondClockValue.
	bytesExpected := header maUnsigned32At: 1.
	compressed := bytesExpected maIsBitSet: 32.
	bytesExpected := bytesExpected maBitClear: 32.
	bytesExpected > MaSerializedGraphBuffer unreasonablePhysicalSize ifTrue: [ MaMalformedRequestError signal: 'unreasonable request size' ].
	incomingSequenceNumber := header maUnsigned32At: 5.
	"To avoid brittleness, let client choose first sequenceNumber"
	aMaRequestLifecycle ifNewAssignSequenceNumber: incomingSequenceNumber-1.
	incomingSequenceNumber < aMaRequestLifecycle incrementSequenceNumber ifTrue:
		[ self
			resend: incomingSequenceNumber
			insteadOf: aMaRequestLifecycle expectedSequenceNumber.
		^ nil ].
	incomingSequenceNumber > aMaRequestLifecycle sequenceNumber ifTrue: [ "Maybe should just allow this?  It probably wouldn't ever happen, but if it did the client is 'satisfied', and maybe because of having sent #wantsResponse=false requests?" (MaClientServerOutOfSequence expected: aMaRequestLifecycle sequenceNumber) signal ].
	answer := aMaRequestLifecycle socketStream next: bytesExpected - serverSocket headerSize.
	self console noteTimeToExtractRequestBytes: (Time millisecondsSince: firstDataReceived).
	aMaRequestLifecycle socketStream isDataAvailable ifTrue: [ NetworkError signal: 'Unexpected client behavior, more bytes received than client stated sending.' ].
	compressed ifTrue: [ answer := answer lzUncompressed ].
	^ answer