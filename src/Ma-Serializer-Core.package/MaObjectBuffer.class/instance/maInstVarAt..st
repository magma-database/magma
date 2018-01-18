access
maInstVarAt: anInteger 

	^ self 
		uint: 48   "self class oidSize"
		at: (self bufferPositionOfInstVarAt: anInteger)