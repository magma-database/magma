accessing
oidFor: anObject ifAbsent: aBlock 
	^ oidManager 
		oidFor: anObject
		ifAbsent: aBlock