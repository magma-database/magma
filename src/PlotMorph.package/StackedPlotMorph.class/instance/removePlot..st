sub-plots
removePlot: aPlotMorph 
	aPlotMorph delete.
	plots remove: aPlotMorph ifAbsent: [ nil ].
	aPlotMorph stack: nil.
	self
		 adjustLimits ;
		 rebuildPlots