private
putByte: anInteger of: aCompiledMethod 
	"Value aBlock with each byteCode and trailer byte."
	byteArray
		at: startPos + self bufferPositionOfByteCodesPlusTrailerBytes + anInteger - 1
		put: (aCompiledMethod basicAt: aCompiledMethod initialPC + anInteger - 1)