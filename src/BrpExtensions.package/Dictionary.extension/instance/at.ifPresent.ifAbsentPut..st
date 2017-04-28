*brpExtensions
at: anObject ifPresent: oneArgBlock ifAbsentPut: zeroArgBlock 
	^ self
		at: anObject
		ifPresent: oneArgBlock
		ifAbsent:
			[ self
				at: anObject
				put: zeroArgBlock value ]