as yet unclassified
oidFor: anObject ifAbsent: aBlock 
	^ anObject maRequiresOwnBuffer 
		ifTrue: 
			[ newOids 
				maAt: anObject realObjectIfMutatingProxy 
				ifPresent: 
					[ : oid | 
					oid 
						ifNil: [ aBlock value ]
						ifNotNil: [ oid ] ]
				ifAbsent: 
					[ super 
						oidFor: anObject
						ifAbsent: aBlock ] ]
		ifFalse: 
			[ super 
				oidFor: anObject
				ifAbsent: aBlock ]