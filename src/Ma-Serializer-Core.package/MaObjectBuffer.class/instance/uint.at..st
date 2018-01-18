private
uint: numberOfBits at: position

	^byteArray
		maUint: numberOfBits
		at: self startPos + position
