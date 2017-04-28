private
write: aMaObjectBuffer at: filePosition
	"Note that the oid is stored in the filePositionsIndex, so there is no need to store it in the data file too.  The oid is the first 8-bytes of the buffer."

	file
		maWrite: aMaObjectBuffer numberOfBytesToStore
		bytesFromPosition:
			aMaObjectBuffer startPos + aMaObjectBuffer bufferPositionOfBytesToStore
		of: aMaObjectBuffer byteArray
		atFilePosition: filePosition