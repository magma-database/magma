*ma-serializer-core
maStreamBytesInto: aMaByteObjectBuffer for: aMaObjectSerializer 
	aMaByteObjectBuffer
		replaceFrom: 1
		to: self size
		with: self
		startingAt: 1