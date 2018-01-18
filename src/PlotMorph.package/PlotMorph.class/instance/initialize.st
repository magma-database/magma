initialization
initialize
	series := Array empty.
	self resetCachedBoundaries.
	xLabel := TextMorph new
		 contents: String empty ;
		 beAllFont: self class defaultFont ;
		 autoFit: true ;
		 wrapFlag: false ;
		 yourself.
	yLabel := xLabel veryDeepCopy.
	grid := PlotMorphGrid on: self.
	super initialize.
	xAxisFormatter := [ : x | x printString ].
	yAxisFormatter := [ : y | y printString ].
	xAxisGridUnit := yAxisGridUnit := Number.
	self crosshairColor:
		((Color cyan
			adjustSaturation: -0.3
			brightness: 0.1) alpha: 0.7).
	self extent: 1 @ 1.
	crosshairStyle := self crosshairStyles second.
	lensStyle := self lensStyles first.
	self registerEventsInterest