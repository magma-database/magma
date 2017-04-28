copying
veryDeepInner: aDeepCopier 
	super veryDeepInner: aDeepCopier.
	operator := operator veryDeepCopyWith: aDeepCopier.
	terms := terms veryDeepCopyWith: aDeepCopier