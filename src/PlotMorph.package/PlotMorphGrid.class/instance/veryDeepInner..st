copying
veryDeepInner: aDeepCopier
	super veryDeepInner: aDeepCopier.
	plot := plot veryDeepCopyWith: aDeepCopier.
	xLabels := xLabels veryDeepCopyWith: aDeepCopier.
	yLabels := yLabels veryDeepCopyWith: aDeepCopier