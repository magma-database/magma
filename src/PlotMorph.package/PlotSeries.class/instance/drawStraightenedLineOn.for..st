drawing
drawStraightenedLineOn: aCanvas for: aPlotMorph 
	| lineColor lastScaledPoint |
	lineColor := self lineColor.
	lastScaledPoint := nil.
	self
		pointsToPlotOn: aPlotMorph
		do:
			[ : point | | scaledPoint |
			scaledPoint := point scaledPoint.
			lastScaledPoint ifNotNil:
				[ aCanvas
					line: lastScaledPoint
					to: scaledPoint
					width: width
					color: lineColor ].
			lastScaledPoint := scaledPoint ]