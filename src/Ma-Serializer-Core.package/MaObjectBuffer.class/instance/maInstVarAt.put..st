access
maInstVarAt: anInteger put: oid

	self
		uint: 48  "self class oidSize"
		at: (self bufferPositionOfInstVarAt: anInteger)
		put: oid
