accessing
at: anInteger 
	^ self 
		at: anInteger
		ifAbsent: [ MagmaUserError signal: 'out of bounds' ]