file
readRecoveryFile: aStandardFileStream at: filePosition 
	| messagePrefix bytesRead inputRecord |
	messagePrefix := 'Ungraceful end of commit-group:  '.
	inputRecord := MaRecoveryRecord new: self defaultRecordSize.
	bytesRead := aStandardFileStream 
		maRead: inputRecord bufferSize
		bytesFromPosition: 1
		of: inputRecord byteArray
		atFilePosition: filePosition.
	(bytesRead 
		between: 1
		and: MaRecoveryRecord sizeOfPhysicalSizeField) ifTrue: 
		[ MaUnreadableRecoveryRecord signal: messagePrefix , 'no forward-recovery records found' ].
	inputRecord physicalSize = 0 ifTrue: [ MaUnreadableRecoveryRecord signal: 'End of recovery group' ].
	inputRecord physicalSize > MaSerializedGraphBuffer unreasonablePhysicalSize ifTrue: 
		[ MaUnreadableRecoveryRecord signal: messagePrefix , 'unreasonable physicalSize found' ].
	"check physicalSize to see if we've read enough."
	inputRecord physicalSize > bytesRead ifTrue: 
		[ "We haven't read enough, read the rest, ensuring we get as much as we should."
		inputRecord byteArray: (self 
				ensureByteArray: inputRecord byteArray
				canHold: inputRecord physicalSize).
		bytesRead := aStandardFileStream 
			maRead: inputRecord physicalSize - bytesRead
			bytesFromPosition: bytesRead + 1
			of: inputRecord byteArray
			atFilePosition: filePosition + bytesRead.
		bytesRead = (inputRecord physicalSize - self defaultRecordSize) ifFalse: [ MaUnreadableRecoveryRecord signal: messagePrefix , 'end of file' ] ].
	self validateRecord: inputRecord.
	^ self selectPreMadeRecord: inputRecord