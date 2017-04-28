testing
isDefined
	^ (Smalltalk hasClassNamed: self className) or:
		[ aliases anySatisfy:
			[ : each | Smalltalk hasClassNamed: each ] ]