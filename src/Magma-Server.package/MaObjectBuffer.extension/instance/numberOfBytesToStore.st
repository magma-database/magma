*magma-server
numberOfBytesToStore
	"Answer the number of bytes that should be stored for this buffer.  This is used by Magma, which doesn't need to store the oid since that is kept in the oid table."

	^self physicalSize - self bufferPositionOfBytesToStore + 1