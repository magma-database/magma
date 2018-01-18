private
adjustExtremes: aMagnitude 
	min
		ifNil: [ min := max := aMagnitude asFloat ]
		ifNotNil:
			[ min := (min min: aMagnitude) asFloat.
			max := (max max: aMagnitude) asFloat ]