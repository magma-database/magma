points
pointsToPlotOn: aPlotMorph do: aBlock 
	points do:
		[ : each | (aPlotMorph shouldPlot: each) ifTrue: [ aBlock value: each ] ]