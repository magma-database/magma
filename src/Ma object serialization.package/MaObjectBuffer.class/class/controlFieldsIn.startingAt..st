accessing
controlFieldsIn: aByteArray startingAt: startPositionOfObjectBuffer

	^ aByteArray
		maUint: 8
		at: startPositionOfObjectBuffer + self bufferPositionOfControlFields