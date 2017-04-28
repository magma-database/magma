initializing
initializePreMadeObjectBuffers

	preMadeObjectBuffers := MaObjectBuffer bufferClasses collect:
		[ :each |
		each
			byteArray: self byteArray
			startPos: 0 ]
