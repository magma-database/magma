private
bufferFor: anObject storageObject: storageObject startingAt: anInteger 
	| buffer |
	buffer := anObject == storageObject 
		ifTrue: [ storageObject realObjectIfMutatingProxy maSelectPreMadeObjectBufferFrom: self ]
		ifFalse: [ self preMadeStorageObjectBuffer ].
	buffer
		startPos: anInteger ;
		ensureSpaceFor: storageObject realObjectIfMutatingProxy
			using: self bpMap.
	buffer byteArray == self byteArray ifFalse: 
		[ "aByteArray must not have been big enough.."
		self byteArray: buffer byteArray ].
	buffer 
		populateHeaderFor: anObject
		using: self.
	buffer 
		populateBodyFor: storageObject realObjectIfMutatingProxy
		using: self.
	^ buffer