access
byteCodeAndTrailerBytesDo: aBlock
	"Value aBlock with each byteCode and trailer byte."
	self bufferPositionOfByteCodesPlusTrailerBytes to: self physicalSize do:
		[ : n |
		aBlock value: (byteArray at: (startPos + n)) ]