accessing
oidFor: anObject ifAbsent: aBlock 
	^ anObject maIsMutatingProxy
		ifTrue: [ anObject maOid ]
		ifFalse:
			[ anObject maRequiresOwnBuffer
				ifTrue:
					[ newOids
						at: anObject
						ifPresent:
							[ : oid | oid
								ifNil: aBlock
								ifNotNil: [ oid ] ]
						ifAbsent:
							[ super
								oidFor: anObject
								ifAbsent: aBlock ] ]
				ifFalse:
					[ super
						oidFor: anObject
						ifAbsent: aBlock ] ]