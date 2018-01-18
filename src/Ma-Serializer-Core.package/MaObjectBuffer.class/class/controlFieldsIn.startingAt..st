accessing
controlFieldsIn: aByteArray startingAt: startPositionOfObjectBuffer
	^ aByteArray
"		maUint: 8"
		byteAt: startPositionOfObjectBuffer + self bufferPositionOfControlFields + 1