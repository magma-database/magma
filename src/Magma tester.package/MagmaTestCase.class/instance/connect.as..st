client
connect: aMagmaLocation as: aString 
	clientSession := aMagmaLocation newSession allowWriteBarrier: self class allowWriteBarrier.
	clientSession connect: (MagmaUser id: aString).
	self assert: clientSession commitNumber > 0