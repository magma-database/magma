accessing
bufferFor: anObject 
	^ transaction
		bufferFor: anObject
		ifAbsent:
			[ (self isPersistent: anObject) ifTrue:
				[ (self oidFor: anObject) ifNotNil:
					[ : oid | self bufferForOid: oid ] ] ]