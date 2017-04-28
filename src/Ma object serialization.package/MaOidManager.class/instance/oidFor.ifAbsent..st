accessing
oidFor: anObject ifAbsent: aBlock 
	^ anObject maRequiresOwnBuffer 
		ifTrue: 
			[ oids 
				at: anObject realObjectIfMutatingProxy
				ifPresent: 
					[ : oid | 
					oid 
						ifNil: [ aBlock value ]
						ifNotNil: [ oid ] ]
				ifAbsent: aBlock ]
		ifFalse: [ anObject maOid ]