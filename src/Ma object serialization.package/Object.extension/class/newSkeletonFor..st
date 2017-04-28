*ma object serialization
newSkeletonFor: aMaVariableObjectBuffer 
	"This is the standard-case for building a skeleton of a variably-sized object."
	^ self basicNew: aMaVariableObjectBuffer objectInstSize - self instSize