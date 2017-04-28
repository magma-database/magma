actions
appendObject: oidInteger into: aMaSerializedGraphBuffer
	"Read a single object into aMaSerializedGraphBuffer and adjust its bufferSize accordingly."

	| buffer |
	preMadeObjectBuffer
		byteArray: aMaSerializedGraphBuffer byteArray;
		startPos: aMaSerializedGraphBuffer bufferSize.
	self
		append: preMadeObjectBuffer
		to: aMaSerializedGraphBuffer
		withDataAt: (self filePointerForOid: oidInteger).
	buffer := preMadeObjectBuffer asSentientBuffer.
	"Set oid only after append because that is where the need for growth is checked."
	buffer oid: oidInteger.
	^buffer
