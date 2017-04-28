building
resetBufferSize
	"Reset the current pointer (which is the bufferSize) back to the beginning."

	self bufferSize: self headerSize
