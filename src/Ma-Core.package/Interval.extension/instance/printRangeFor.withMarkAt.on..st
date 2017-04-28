*ma-core
printRangeFor: aNumber withMarkAt: marker on: aStream 
	"The range of performance of this trade, with the final close enclosed in vertical bars.  The + sign marks the break-even point."
	(aNumber isNaN or: [ aNumber isInfinite ])
		ifTrue: [ aStream maPrint: 'n/a' ]
		ifFalse:
			[ | priorN markerChar decimalPlaces |
			markerChar := $+.
			decimalPlaces := ((step log: 10) roundTo: 1) abs.
			start > marker ifTrue: [ aStream maPrint: markerChar ].
			start = aNumber ifFalse: [ aStream maPrint: (start printShowingDecimalPlaces: decimalPlaces) ].
			priorN := start.
			self do:
				[ : n | aStream nextPut:
					((marker
						between: priorN
						and: n)
						ifTrue: [ markerChar ]
						ifFalse: [ $- ]).
				(aNumber
					between: priorN
					and: n) ifTrue: [ aStream maPrint: (aNumber printShowingDecimalPlaces: decimalPlaces) ].
				priorN := n ].
			aStream maPrint: (stop printShowingDecimalPlaces: decimalPlaces).
			stop < marker ifTrue: [ aStream maPrint: markerChar ] ]