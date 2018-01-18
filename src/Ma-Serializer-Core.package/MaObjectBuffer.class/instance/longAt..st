private
longAt: position 
	^ byteArray
		longAt: self startPos + position + 1
		bigEndian: false