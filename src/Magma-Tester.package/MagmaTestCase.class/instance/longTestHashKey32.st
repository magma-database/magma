test floats
longTestHashKey32
	| currentHash priorHash |
	priorHash := nil.
	Float lowestToHighest32BitFloatsDo:
		[ : float | currentHash := float hashKey32.
		(priorHash ~~ nil and: [ float ~= 0.0 ]) ifTrue: [ self assert: currentHash > priorHash ].
		priorHash := currentHash ]