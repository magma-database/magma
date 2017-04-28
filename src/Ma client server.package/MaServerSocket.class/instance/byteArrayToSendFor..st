private
byteArrayToSendFor: aByteArray 
	| answer byteArrayToSend sendSize header |
	byteArrayToSend := aByteArray size > self compressThreshold  
		ifTrue: 
			[ | compressed |
			compressed := aByteArray lzCompressed.
			compressed size < aByteArray size 
				ifTrue: [ compressed ]
				ifFalse: [ aByteArray ] ]
		ifFalse: [ aByteArray ].
	answer := ByteArray new: byteArrayToSend size + self headerSize.
	sendSize := answer size.
	"Set high bit if compressed."
	header := self 
		setCompressedBit: aByteArray ~~ byteArrayToSend
		for: answer size.
	answer 
		maUint: 32
		at: 0
		put: header.
	answer 
		replaceFrom: self headerSize + 1
		to: sendSize
		with: byteArrayToSend
		startingAt: 1.
	^ answer