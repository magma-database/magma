private non-collection samples
byteArraySamples

	^Array
		with: ByteArray new
		with: (ByteArray new: 100)
		with: (0 to: 255) asByteArray
