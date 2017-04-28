accessing
bufferClassFor: aByteArray startPos: anInteger

	^ self bufferClasses at: 
		(self
			bufferTypeIn: aByteArray
			startingAt: anInteger)