as yet unclassified
remove: anObject ifAbsent: aBlock 
	^ self 
		removeKey: anObject
		ifAbsent: aBlock