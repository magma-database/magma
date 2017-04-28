*magma server-file
currentRecordFor: aMaAtomicFileWriter 
	| answer |
	answer := ByteArray new: aMaAtomicFileWriter byteArray size.
	guard critical: 
		[ self 
			streamAt: aMaAtomicFileWriter filePos
			withRelativePositionDo: 
				[ : physicalStream : relativePos | 
				self renewAccess: physicalStream.
				physicalStream 
					maRead: answer size
					bytesFromPosition: 1
					of: answer
					atFilePosition: relativePos ]
			ifNone: 
				[ MagmaSoftwareError signal: 'expected physical data at ' , aMaAtomicFileWriter filePos asString ] ].
	^ answer