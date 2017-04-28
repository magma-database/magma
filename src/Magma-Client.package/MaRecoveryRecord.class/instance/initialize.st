initialize-release
initialize

	super initialize.
	byteArray := ByteArray new: self headerSize + self bodySize + self checkSumSize.
	self isFixed ifTrue: [ self physicalSize: byteArray size ].
	self recordType: self class assignedRecordType