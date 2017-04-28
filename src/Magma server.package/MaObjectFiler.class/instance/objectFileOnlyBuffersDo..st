utilities
objectFileOnlyBuffersDo: oneArgBlock 
	| graphBuffer nextStart oidSize |
	oidSize := MaObjectBuffer oidSize / 8.
	nextStart := self class sizeOfEmptyRepository.
	[ nextStart < file size ] whileTrue:
		[ graphBuffer := MaSerializedGraphBuffer new: 400.
		preMadeObjectBuffer
			 byteArray: graphBuffer byteArray ;
			 startPos: graphBuffer headerSize.
		self
			append: preMadeObjectBuffer
			to: graphBuffer
			withDataAt: nextStart.
		oneArgBlock value: graphBuffer.
		nextStart := nextStart + preMadeObjectBuffer physicalSize - oidSize ]