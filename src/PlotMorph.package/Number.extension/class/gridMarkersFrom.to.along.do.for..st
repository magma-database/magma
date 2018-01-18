*plotmorph
gridMarkersFrom: min to: max along: xOrY do: oneArgBlock for: aPlotMorph 
	| currentPower gridSpacing roughGridSpacing step |
	max=min ifTrue: [ ^ self ].
	roughGridSpacing := nil.
	currentPower := (max - min log: 10) truncated + 2.
	"Find the finest-grained power we can use without spacing closer than 25 pixels."
	[ | dataMarker |
	dataMarker := xOrY = #x
		ifTrue: [ min + (10 raisedTo: currentPower - 1) @ 0 ]
		ifFalse: [ 0 @ (max - (10 raisedTo: currentPower - 1)) ].
	gridSpacing := ((aPlotMorph scale: dataMarker) perform: xOrY) - (aPlotMorph margin perform: xOrY).
	roughGridSpacing ifNil: [ roughGridSpacing := gridSpacing ].
	gridSpacing < 25 ] whileFalse:
		[ currentPower := currentPower - 1.
		roughGridSpacing := gridSpacing ].
	step := (10 raisedTo: currentPower) /
		(roughGridSpacing > 50
			ifTrue: [ 2 ]
			ifFalse: [ 1 ]).
	(min roundUpTo: step)
		to: (max truncateTo: step)
		by: step
		do:
			[ : dataMarker | oneArgBlock value: dataMarker ]