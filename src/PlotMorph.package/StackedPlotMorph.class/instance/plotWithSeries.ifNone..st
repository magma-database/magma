sub-plots
plotWithSeries: aPlotSeries ifNone: aBlock 
	^ plots
		detect:
			[ : each | each series anySatisfy:
				[ : eachSeries | eachSeries = aPlotSeries ] ]
		ifNone: aBlock