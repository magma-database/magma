debugging
bufferFor: oidInteger 
	| buffer |
	buffer := MaSerializedGraphBuffer new: 400.
	self 
		appendObject: oidInteger
		into: buffer.
	^ buffer rootBuffer trimByteArray