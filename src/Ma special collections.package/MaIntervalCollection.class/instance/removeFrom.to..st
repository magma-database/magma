add / remove
removeFrom: low to: high
"Removing is a two-step process:
1) remove intervals completely contained by input
2) adjust intersecting intervals
	- each intersects input-low only, set its high to input-low
	- each intersects input-high only, set its low to input-high
	- each intersects input-low and input-high, set its high to inputs-low and addFrom: inputs-high to its original high"

	(self intervalsInside: (low to: high)) do: [ : each | intervals remove: each ].
	(self intervalsIntersecting: (self expandedFrom: low to: high))
		do: 
			[ : each |  | eachIntersectsLow eachIntersectsHigh |
			eachIntersectsLow := low between: each first and: each last.
			eachIntersectsHigh := high between: each first and: each last.
			{ eachIntersectsLow. eachIntersectsHigh } caseOf:
				{ [ { true. false } ] -> [ each setFrom: each first to: high by: each increment ].
				[ { false. true } ] -> [ each setFrom: low to: each last by: each increment ].
				[ { true. true } ] -> 
					[ | oldHigh |
					oldHigh := each last.
					each setFrom: each first to: low by: each increment.
					self addFrom: high to: oldHigh ] } ]