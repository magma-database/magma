copying
veryDeepInner: aDeepCopier
	super veryDeepInner: aDeepCopier.
	grid := grid veryDeepCopyWith: aDeepCopier.
	series := series veryDeepCopyWith: aDeepCopier.
	scaledPoints := nil.
	xLabel := xLabel veryDeepCopyWith: aDeepCopier.
	yLabel := yLabel veryDeepCopyWith: aDeepCopier.
	xValuesToSkip := xValuesToSkip veryDeepCopyWith: aDeepCopier