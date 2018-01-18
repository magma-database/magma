series
removeSeries: aPlotSeries 
	| plot |
	plot := self
		plotWithSeries: aPlotSeries
		ifNone: [ ^ self ].
	plot removeSeries: aPlotSeries.
	plot series
		ifEmpty: [ self removePlot: plot ]
		ifNotEmpty: [ self rebuildPlots ].
	^ aPlotSeries