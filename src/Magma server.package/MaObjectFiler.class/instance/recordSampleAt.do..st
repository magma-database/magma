accessing
recordSampleAt: filePointer do: oneArgBlock 
	"Value oneArgBlock with the header and enough bytes for the first two oid pointers of MaObjectBuffer currently residing at filePointer."
	preMadeObjectBuffer startPos: 0.
	file 
		maRead: 32 "(MagmaBufferPositionMap headerSize - preMadeObjectBuffer bufferPositionOfBytesToStore + 1) + (2*(MaObjectBuffer oidSize/8))"
		bytesFromPosition: preMadeObjectBuffer bufferPositionOfBytesToStore
		of: preMadeObjectBuffer byteArray
		atFilePosition: filePointer.
	^ oneArgBlock value: preMadeObjectBuffer