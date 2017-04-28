signaling
referencingBuffer: aMaObjectBuffer oidOfMissingBuffer: anInteger signal: aString 
	^ ((self messageText: aString)
		setReferencingBuffer: aMaObjectBuffer
		oidOfMissingBuffer: anInteger) signal