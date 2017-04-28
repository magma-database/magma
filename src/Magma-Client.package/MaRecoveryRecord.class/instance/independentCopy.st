copying
independentCopy
	^ self copy
		byteArray: (byteArray copyFrom: 1 to: self physicalSize) ;
		yourself