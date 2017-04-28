printing
printOn: aStream

	super printOn: aStream.
	buffer isBytes
		ifTrue:
			[ aStream nextPutAll: buffer asString ]
		ifFalse:
			[ self
				maPrintAttributes: #(oid objectClassName)
				on: aStream ]