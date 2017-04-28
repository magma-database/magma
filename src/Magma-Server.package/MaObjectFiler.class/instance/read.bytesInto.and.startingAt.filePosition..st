private
read: numberOfBytes bytesInto: aMaObjectBuffer and: aMaSerializedGraphBuffer startingAt: startPos filePosition: anInteger 
	"startPos is 0-based, answer the physicalSize of the buffer read."
	^ file guard:
		[ | physicalSize numberOfBytesRead numberOfBytesStored |
		numberOfBytesRead := file
			maRead: numberOfBytes
			bytesFromPosition: startPos + aMaObjectBuffer bufferPositionOfBytesToStore
			of: aMaObjectBuffer byteArray
			atFilePosition: anInteger.
		"See if we have read enough, if not read the rest of the buffer."
		numberOfBytesStored := aMaObjectBuffer numberOfBytesToStore.
		physicalSize := aMaObjectBuffer physicalSize.
		numberOfBytesStored > numberOfBytesRead ifTrue:
			[ | resumePosition |
			resumePosition := startPos + numberOfBytesRead + aMaObjectBuffer bufferPositionOfBytesToStore.
			self
				ensureByteArrayIn: aMaObjectBuffer
				and: aMaSerializedGraphBuffer
				canAccomodate: physicalSize
				bytesFrom: resumePosition.
			file
				next: numberOfBytesStored - numberOfBytesRead
				into: aMaSerializedGraphBuffer byteArray
				startingAt: resumePosition ].
		physicalSize ]