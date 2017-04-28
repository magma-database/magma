*ma base additions
lzCompressed
	| compressor compressed |
	compressed := RWBinaryOrTextStream on: ByteArray new.
	compressor := GZipWriteStream on: compressed.
	compressor nextPutAll: self.
	compressor close.
	^ compressed contents