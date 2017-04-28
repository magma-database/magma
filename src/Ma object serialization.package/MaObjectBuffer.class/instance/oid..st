access
oid: anInteger

	self
		uint: 48  "self class oidSize"
		at: self bufferPositionOfOid
		put: anInteger
