accessing
controlFields2In: aByteArray startingAt: startPositionOfObjectBuffer
	^ aByteArray
"		maUint: 8"
		byteAt: startPositionOfObjectBuffer + self bufferPositionOfControlFields2 + 1