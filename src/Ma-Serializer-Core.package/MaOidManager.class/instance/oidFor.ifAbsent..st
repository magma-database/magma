accessing
oidFor: anObject ifAbsent: aBlock 
	^ anObject maRequiresOwnBuffer
		ifTrue:
			[ oids
				at: anObject
				ifPresent: [ : oid | oid ifNil: aBlock ]
				ifAbsent: aBlock ]
		ifFalse: [ anObject maOid ]