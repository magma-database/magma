creation
createObjectUsing: aMaObjectSerializer 
	| cm offset |
	cm := CompiledMethod
		newMethod: self byteCodesPlusTrailerSize
		header: self headerForThisVm.
	"First populate the bytes."
	offset := self bufferPositionOfByteCodesPlusTrailerBytes.
	1
		to: self byteCodesPlusTrailerSize
		do:
			[ : n | cm
				basicAt: cm initialPC + n - 1
				put: (byteArray at: startPos + offset + n - 1) ].
	^ cm