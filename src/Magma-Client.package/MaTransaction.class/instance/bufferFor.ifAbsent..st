private
bufferFor: anObject ifAbsent: aBlock 
	^ readSet 
		at: anObject
		ifAbsent: aBlock