debugging
asMaObjectBuffer

	self fileId = 1 ifFalse: [ self error: 'not a before-image of a MaObjectBuffer.' ].
	^ (MaObjectBuffer
		byteArray: (ByteArray new: MaObjectBuffer oidSize/8), self record
		startPos: 0) asSentientBuffer