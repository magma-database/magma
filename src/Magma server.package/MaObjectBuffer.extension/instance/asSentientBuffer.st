*magma server
asSentientBuffer
	"Convert me to a buffer of the correct type."
	^ self species 
		createFromByteArray: byteArray
		startPos: startPos