private
append: aMaObjectBuffer to: aMaSerializedGraphBuffer withDataAt: filePositionInteger 
	| startPos |
	startPos := aMaSerializedGraphBuffer bufferSize.
	startPos > MaSerializedGraphBuffer sizeWarningThreshold ifTrue: [ (MaEnvironmentError messageText: 'Read too big (>' , startPos asBytesDescription , ').  Make a smaller read or increase the MaSerializedGraphBuffer class>>#sizeWarningThreshold on the server.') signal ].
	self
		ensureByteArrayIn: aMaObjectBuffer
		and: aMaSerializedGraphBuffer
		canAccomodate: self trackSize + aMaObjectBuffer bufferPositionOfBytesToStore
		bytesFrom: startPos + 1.
	aMaSerializedGraphBuffer increaseBufferSizeBy:
		(self
			read: self trackSize
			bytesInto: aMaObjectBuffer
			and: aMaSerializedGraphBuffer
			startingAt: startPos
			filePosition: filePositionInteger)