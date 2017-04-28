accessing
at: key ifAbsent: aBlock
	^ (super
		at: key
		ifAbsent: [ ^ aBlock value ]) at: 1