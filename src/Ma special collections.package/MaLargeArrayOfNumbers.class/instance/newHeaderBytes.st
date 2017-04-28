initialize
newHeaderBytes
	"Answer a new ByteArray containing the header for the receiver.
	This is only used when creating the an instance of this class with
	the create: constructor."

	^(ByteArray new: self headerSize)
		maUint: 8
		at: 0
		put: broker recordSize;
		yourself
