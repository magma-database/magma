private
populateBytesFor: aCompiledMethod using: aMaObjectSerializer 
	1
		to: aCompiledMethod maBytesSize
		do:
			[ : n | self
				putByte: n
				of: aCompiledMethod ]