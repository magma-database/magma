printing
bytes
	^ ByteArray streamContents:
		[ : stream | self byteCodeAndTrailerBytesDo:
			[ : eachByte | stream nextPut: eachByte ] ]