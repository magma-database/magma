private
uint: numberOfBits at: zeroBasedIndexPosition put: valueInteger

	^byteArray
		maUint: numberOfBits
		at: self startPos + zeroBasedIndexPosition
		put: valueInteger
