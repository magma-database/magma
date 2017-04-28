accessing
recordSampleAt: filePointer do: oneArgBlock 
	"Value oneArgBlock with the header and enough bytes for the first 8 oid pointers of MaObjectBuffer currently residing at filePointer.  8 because we need up to and including the 'deltaSum' inst-var of MagmaStat."
	preMadeObjectBuffer startPos: 0.
	file 
		maRead: 72 "(MagmaBufferPositionMap headerSize - 7 + 1) + (8*(MaObjectBuffer oidSize/8))"
		bytesFromPosition: preMadeObjectBuffer bufferPositionOfBytesToStore
		of: preMadeObjectBuffer byteArray
		atFilePosition: filePointer.
	^ oneArgBlock value: preMadeObjectBuffer