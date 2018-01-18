drawing
gridPositionsAlong: widthOrHeight do: oneArgBlock 
	| xOrY gridUnit min max |
	widthOrHeight = #width
		ifTrue:
			[ xOrY := #x.
			gridUnit := plot xAxisGridUnit ]
		ifFalse:
			[ xOrY := #y.
			gridUnit := plot yAxisGridUnit ].
	min := plot minPoint perform: xOrY.
	max := plot maxPoint perform: xOrY.
	gridUnit
		gridMarkersFrom: min
		to: max
		along: xOrY
		do: oneArgBlock
		for: plot