private
loadByteArrayWith: aByteArray startingAt: indexPosition count: anInteger 
	"Load my byteArray with aByteArray, compressing if it appropriate."
	| sendSize byteArrayToSend compressed header |
	byteArrayToSend := anInteger > self compressThreshold 
		ifTrue: 
			[ compressed := aByteArray size > anInteger 
				ifTrue: [ (aByteArray 
					copyFrom: 1
					to: anInteger) lzCompressed ]
				ifFalse: [ aByteArray lzCompressed ].
			compressed size < anInteger 
				ifTrue: 
					[ sendSize := self headerSize + compressed size.
					compressed ]
				ifFalse: 
					[ sendSize := self headerSize + anInteger.
					compressed := nil.
					aByteArray ] ]
		ifFalse: 
			[ sendSize := self headerSize + anInteger.
			aByteArray ].
	self ensureByteArrayCanHold: sendSize.
	byteArray 
		replaceFrom: self headerSize + 1
		to: sendSize
		with: byteArrayToSend
		startingAt: indexPosition.
	"If compressed, indicate so in the high-bit of the header."
	header := self 
		setCompressedBit: compressed notNil
		for: sendSize.
	byteArray 
		maUint: 32
		at: 0
		put: header.
	^ sendSize