series
addSeries: aPlotSeries
	series := series copyWith: aPlotSeries.
	self
		 resetCachedBoundaries ;
		 changed.
	aPlotSeries addDependent: self.
	^ aPlotSeries