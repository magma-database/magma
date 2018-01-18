add / remove
addFrom: low to: high

	| intersecting lowestLow highestHigh |
	low > high ifTrue: [ self error: 'low should be lower than high' ].
	intersecting := self intervalsIntersecting: (self expandedFrom: low to: high).
	lowestLow := low.
	highestHigh := high.
	intersecting do:
		[ : each |
		lowestLow := lowestLow min: each first.
		highestHigh := highestHigh max: each last ].
	intervals
		removeAll: intersecting ;
		add: (lowestLow to: highestHigh)