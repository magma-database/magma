private
bufferFor: anObject is: aMaObjectBuffer 
	anObject isBehindWriteBarrier ifTrue: [ MagmaSoftwareError signal: 'should not add objects behind WB to the readSet!' ].
	readSet
		at: anObject
		put: aMaObjectBuffer trimByteArray