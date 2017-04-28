overriding
at: anIndex ifAbsent: aBlock

	self hasAdditions ifFalse: [ ^ aBlock value ].
	^ self added
		at: anIndex
		ifAbsent: aBlock