copying
veryDeepInner: aDeepCopier
	super veryDeepInner: aDeepCopier.
	text := text veryDeepCopyWith: aDeepCopier