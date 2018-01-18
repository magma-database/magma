building
increaseBufferSizeBy: anInteger

	anInteger < self headerSize
		ifTrue:
			[ MaObjectSerializationSoftwareError signal: 'This object being appended is not properly supported.' ].
	self bufferSize: self bufferSize + anInteger
