drawing
drawSteppedLineOn: aCanvas for: aPlotMorph 
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
					to: scaledPoint x @ lastScaledPoint y
					width: width
					color: lineColor.
				aCanvas
					line: scaledPoint x @ lastScaledPoint y
					to: scaledPoint
					width: width
					color: lineColor ].
			lastScaledPoint := scaledPoint ]