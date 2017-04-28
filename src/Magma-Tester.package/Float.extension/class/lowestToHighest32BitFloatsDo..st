*magma-tester
lowestToHighest32BitFloatsDo: aBlock 
	| priorFloat currentFloat |
	aBlock value: (priorFloat := self negativeInfinity).
	Float negativeInfinity asIEEE32BitWord - 1
		to: 2147483648  "-0.0"
		by: -1
		do:
			[ : n | self assert: (currentFloat := Float fromIEEE32Bit: n) > priorFloat.
			aBlock value: currentFloat.
			priorFloat := currentFloat ].
	self
		 assert: currentFloat == Float negativeZero ;
		 assert: currentFloat = 0.0.
	"Everything okay.  Now make priorFloat negative for first assert: in the positive range, because 0.0 > -0.0 reports false."
	priorFloat := -1.0.
	0
		to: 2139095040 "+Infinity"
		do:
			[ : n | self assert: (currentFloat := Float fromIEEE32Bit: n) > priorFloat.
			aBlock value: currentFloat.
			priorFloat := currentFloat ]