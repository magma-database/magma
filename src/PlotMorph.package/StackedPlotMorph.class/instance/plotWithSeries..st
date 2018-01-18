sub-plots
plotWithSeries: aPlotSeries 
	^ self
		plotWithSeries: aPlotSeries
		ifNone: [plots errorNotFound: aPlotSeries ]