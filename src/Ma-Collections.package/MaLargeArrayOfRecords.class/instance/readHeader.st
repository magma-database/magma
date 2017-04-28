initialize-release
readHeader

	| headerBytes |
	headerBytes := ByteArray new: self headerSize.
	broker readHeaderInto: headerBytes.
	self initializeFromHeader: headerBytes