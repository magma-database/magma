private
longAt: position put: anInteger
	^ byteArray
		longAt: self startPos + position + 1
		put: anInteger
		bigEndian: false