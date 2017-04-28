private
bufferFor: anObject is: aMaObjectBuffer 
	readSet 
		at: anObject
		put: aMaObjectBuffer trimByteArray