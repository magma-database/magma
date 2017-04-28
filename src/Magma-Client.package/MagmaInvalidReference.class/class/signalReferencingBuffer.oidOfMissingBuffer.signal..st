signaling
signalReferencingBuffer: aMaObjectBuffer oidOfMissingBuffer: anInteger signal: aString 
	^ ((self messageText: aString)
		setReferencingBuffer: aMaObjectBuffer
		oidOfMissingBuffer: anInteger) signal