private
ensureCanHold: numberOfBytes

	byteArray size >= (self headerSize + numberOfBytes + self checkSumSize)
		ifFalse:
			[ | newByteArray |
			newByteArray := ByteArray new: self headerSize + numberOfBytes + self checkSumSize.
			newByteArray
				replaceFrom: 1
				to: byteArray size
				with: byteArray
				startingAt: 1.
			byteArray := newByteArray ]