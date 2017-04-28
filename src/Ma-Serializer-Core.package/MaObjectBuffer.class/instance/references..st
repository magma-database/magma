testing
references: oid 
	^ self isPointers and: 
		[ (1 to: self objectInstSize) anySatisfy: [ : n | (self maInstVarAt: n) = oid ] ]