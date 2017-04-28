access
at: key ifAbsent: aBlock 
	^ (self
		associationAt: key
		ifAbsent: [ ^ aBlock value ]) value