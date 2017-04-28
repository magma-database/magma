*ma object serialization
maBuffersDo: aBlock 
	[ self maNextBufferDo: aBlock ] whileTrue