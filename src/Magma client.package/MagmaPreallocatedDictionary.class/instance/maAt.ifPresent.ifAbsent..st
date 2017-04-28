access
maAt: anObject ifPresent: oneArgBlock ifAbsent: zeroArgBlock 
	^ oneArgBlock value:
		(self
			at: anObject
			ifAbsent: [ ^ zeroArgBlock value ])