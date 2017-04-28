accessing
instVarAt: instVarIndex
	"Overriding for speed, to avoid having to go through #doesNotUnderstand:."
	^ self realObjectIfMutatingProxy instVarAt: instVarIndex