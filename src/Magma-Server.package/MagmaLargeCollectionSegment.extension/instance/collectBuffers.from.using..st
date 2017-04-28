*magma-server-private
collectBuffers: sessionId from: aMaObjectRepository using: aMaReadStrategy 
	| readStrategy |
	readStrategy := aMaObjectRepository 
		ensureReadStrategy: aMaReadStrategy
		forSession: sessionId.
	self objects withIndexDo: 
		[ : eachHashAndOid : n | 
		eachHashAndOid isVariableBinding 
			ifTrue: 
				[ eachHashAndOid value: (aMaObjectRepository 
						byteArrayAt: eachHashAndOid value
						using: readStrategy) ]
			ifFalse: 
				[ "For member index accesses, there are no extra hash keys, so don't waste the bandwidth."
				self objects 
					at: n
					put: 
						(aMaObjectRepository 
							byteArrayAt: eachHashAndOid "really just the oid"
							using: readStrategy) ] ]