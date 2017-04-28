accessing
slotAt: instVarIndex put: anObject 
	"Overriding for speed, to avoid having to go through #doesNotUnderstand:."
	^ self realObjectIfMutatingProxy
		slotAt: instVarIndex
		put: anObject