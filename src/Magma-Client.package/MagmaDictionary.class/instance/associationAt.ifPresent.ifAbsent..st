access
associationAt: anObject ifPresent: oneArgBlock ifAbsent: zeroArgBlock 
	^ oneArgBlock value:
		(self
			associationAt: anObject
			ifAbsent: [ ^ zeroArgBlock value ])