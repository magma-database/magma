private
bufferFor: anObject storageObject: storageObject startingAt: anInteger 
	| buffer |
	buffer := anObject == storageObject 
		ifTrue: [ storageObject maSelectPreMadeObjectBufferFrom: self ]
		ifFalse: [ self preMadeStorageObjectBuffer ].
	buffer
		startPos: anInteger ;
		ensureSpaceFor: storageObject
			using: self bpMap.
	buffer byteArray == self byteArray ifFalse: 
		[ "aByteArray must not have been big enough.."
		self byteArray: buffer byteArray ].
	buffer 
		populateHeaderFor: anObject
		storageObject: storageObject
		using: self.
	buffer 
		populateBodyFor: storageObject
		using: self.
	^ buffer