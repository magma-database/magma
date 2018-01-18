series
removeSeries: aPlotSeries 
	| index |
	index := series indexOf: aPlotSeries.
	index = 0 ifTrue: [ ^ self ].
	series := series copyWithoutIndex: index.
	self
		 resetCachedBoundaries ;
		 changed.
	^ aPlotSeries