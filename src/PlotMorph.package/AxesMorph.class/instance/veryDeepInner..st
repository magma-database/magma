copying
veryDeepInner: aDeepCopier
	super veryDeepInner: aDeepCopier.
	form := form veryDeepCopyWith: aDeepCopier.
	title := title veryDeepCopyWith: aDeepCopier.
	stack := stack veryDeepCopyWith: aDeepCopier