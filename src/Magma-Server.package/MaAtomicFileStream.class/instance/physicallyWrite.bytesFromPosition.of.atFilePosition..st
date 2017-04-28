private
physicallyWrite: numberOfBytes bytesFromPosition: bufferPosition of: aByteArray atFilePosition: filePosition 
	guard critical: 
		[ self 
			streamAt: filePosition
			withRelativePositionDo: 
				[ : fileStream : relativePos | 
				self renewAccess: fileStream.
				fileStream 
					maWrite: aByteArray size
					bytesFromPosition: 1
					of: aByteArray
					atFilePosition: relativePos ]
			ifNone: 
				[ "filePosition is beyond the end of the last file, so we know we will write either the last file or a new file,"
				| streamToWrite positionOfLastFileStream |
				streamToWrite := (sizes isEmpty or: [ aByteArray size + sizes last > self maxPhysicalFileSize ]) 
					ifTrue: [ self addPhysicalFile ]
					ifFalse: [ fileStreams last ].
				self renewAccess: streamToWrite.
				positionOfLastFileStream := self committedSize - sizes last.
				streamToWrite 
					maWrite: numberOfBytes
					bytesFromPosition: 1
					of: aByteArray
					atFilePosition: filePosition - positionOfLastFileStream.
				sizes 
					at: sizes size
					put: fileStreams last size ] ]