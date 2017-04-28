accessing
instVarAt: instVarIndex put: anObject 
	"Overriding for speed, to avoid having to go through #doesNotUnderstand:."
	^ self realObjectIfMutatingProxy
		instVarAt: instVarIndex
		put: anObject