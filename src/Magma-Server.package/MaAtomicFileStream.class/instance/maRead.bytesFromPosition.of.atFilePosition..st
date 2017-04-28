filestream api
maRead: someNumber bytesFromPosition: bufferPosition of: aByteArray atFilePosition: filePosition 
	| writer numberOfBytesRead |
	^ guard critical: 
		[ (writer := self writerAt: filePosition) 
			ifNil: 
				[ numberOfBytesRead := self 
					streamAt: filePosition
					withRelativePositionDo: 
						[ : physicalStream : relativePosition | 
						self renewAccess: physicalStream.
						physicalStream 
							maRead: someNumber
							bytesFromPosition: bufferPosition
							of: aByteArray
							atFilePosition: relativePosition ]
					ifNone: [ 0 ].
				position := filePosition + numberOfBytesRead.
				numberOfBytesRead ]
			ifNotNil: 
				[ numberOfBytesRead := someNumber min: writer byteArray size.
				aByteArray 
					replaceFrom: bufferPosition
					to: bufferPosition + numberOfBytesRead - 1
					with: writer byteArray
					startingAt: 1.
				position := filePosition + numberOfBytesRead.
				numberOfBytesRead ] ]