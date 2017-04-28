copying
veryDeepInner: aDeepCopier 
	"Overridden or else DeepCopier will clone all variables, but we want to share them."
	super veryDeepInner: aDeepCopier