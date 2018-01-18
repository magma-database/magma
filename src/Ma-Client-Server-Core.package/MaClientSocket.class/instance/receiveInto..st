private
receiveInto: aByteArray 
	"First, we receive into *my* byteArray, then I paste it into aByteArray."
	| header bodySize bytesExpected answer startedWaitingForResponse compressed incomingSequenceNumber |
	startedWaitingForResponse := Time millisecondClockValue.
	[ header := socketStream next: self headerSize.
	bytesExpected := header maUnsigned32At: 1.
	compressed := bytesExpected maIsBitSet: 32.
	compressed ifTrue: [ bytesExpected := bytesExpected maBitClear: 32 ].
	incomingSequenceNumber := header maUnsigned32At: 5.
	answer := (bodySize := bytesExpected - self headerSize) > aByteArray size
		ifTrue: [ ByteArray new: bodySize ]
		ifFalse: [ aByteArray ].
	socketStream
		next: bodySize
		into: answer.
	incomingSequenceNumber > sequenceNumber ifTrue: [ (MaClientServerOutOfSequence expected: sequenceNumber) signal ].
	incomingSequenceNumber < sequenceNumber ] whileTrue.
	stat timeReceivingResponsesHistory addValue: (Time millisecondsSince: startedWaitingForResponse).
	^ compressed
		ifTrue: [ answer lzUncompressed ]
		ifFalse: [ answer ]