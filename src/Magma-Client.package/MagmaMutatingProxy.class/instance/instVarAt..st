accessing
instVarAt: instVarIndex 
	"Overriding for speed, to avoid having to go through #doesNotUnderstand:."
	^ MagmaPreferences debugProxies
		ifTrue: [ self primInstVarAt: instVarIndex ]
		ifFalse: [ self realObjectIfMutatingProxy instVarAt: instVarIndex ]