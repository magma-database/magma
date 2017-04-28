*magma-server
writeTo: applyFile 
	self resetChecksum.
	applyFile
		next: self physicalSize
			putAll: byteArray
			startingAt: 1