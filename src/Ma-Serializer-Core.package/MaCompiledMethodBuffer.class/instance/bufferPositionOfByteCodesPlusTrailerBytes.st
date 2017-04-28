private
bufferPositionOfByteCodesPlusTrailerBytes
	"The 1-based delta from my startPos where the bytes of the original CompiledMethod are stored."
	^ self headerSize + self objectSize + 1