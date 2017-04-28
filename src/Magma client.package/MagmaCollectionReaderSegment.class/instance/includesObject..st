testing
includesObject: anObject 
	^ objects anySatisfy: [ : each | each value = anObject ]