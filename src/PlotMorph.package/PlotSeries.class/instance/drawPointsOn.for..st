drawing
drawPointsOn: aCanvas for: aPlotMorph 
	self
		pointsToPlotOn: aPlotMorph
		do:
			[ : point | point
				drawOn: aCanvas
				plot: aPlotMorph
				offset: 0 ]