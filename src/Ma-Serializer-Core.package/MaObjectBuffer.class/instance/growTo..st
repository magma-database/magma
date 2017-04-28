private
growTo: anInteger

	self byteArray: (
		(ByteArray new: anInteger)
			replaceFrom: 1
			to: byteArray size
			with: byteArray
			startingAt: 1)
