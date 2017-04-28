testing
isDefined
	^ {  (self className)  } , aliases anySatisfy: [ : each | Smalltalk hasClassNamed: each ]