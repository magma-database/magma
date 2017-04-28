private
fillByteObject: byteObject

	^byteObject
		replaceFrom: 1
		to: byteObject size
		with: byteArray
		startingAt: self startPos + self headerSize + 1.
