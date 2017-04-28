*ma object serialization
maSizeIn: aMaObjectBuffer
	"Answer the size of the buffer that contains the object references, excluding the header."

	^ self maBufferInstSize * aMaObjectBuffer slotSize