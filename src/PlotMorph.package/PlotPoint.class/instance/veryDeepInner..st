copying
veryDeepInner: aDeepCopier
	super veryDeepInner: aDeepCopier.
	series := series veryDeepCopyWith: aDeepCopier.
