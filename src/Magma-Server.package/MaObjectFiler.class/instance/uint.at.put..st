private
uint: bits at: filePointer put: anInteger 
	| ba bytes |
	ba := self usedByteArray: (bytes := bits / 8).
	ba 
		maUint: bits
		at: 0
		put: anInteger.
	file 
		maWrite: bytes
		bytesFromPosition: 1
		of: ba
		atFilePosition: filePointer