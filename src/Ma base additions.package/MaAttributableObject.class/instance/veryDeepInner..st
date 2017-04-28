copying
veryDeepInner: aDeepCopier 
	super veryDeepInner: aDeepCopier.
	attributes := attributes veryDeepCopyWith: aDeepCopier