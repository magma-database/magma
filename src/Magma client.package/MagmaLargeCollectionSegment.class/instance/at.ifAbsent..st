accessing
at: anInteger ifAbsent: aBlock 
	^ objects
		at: anInteger - startIndex + 1
		ifAbsent: [ ^ aBlock value ]