creation
createFromByteArray: aByteArray startPos: anInteger

	^(self
		bufferClassFor: aByteArray
		startPos: anInteger)
			byteArray: aByteArray
			startPos: anInteger
