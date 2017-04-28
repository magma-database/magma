accessing
controlFields2In: aByteArray startingAt: startPositionOfObjectBuffer
	^ aByteArray
		maUint: 8
		at: startPositionOfObjectBuffer + self bufferPositionOfControlFields2