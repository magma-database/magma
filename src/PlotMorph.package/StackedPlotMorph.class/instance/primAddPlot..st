private
primAddPlot: aPlotMorph 
	plots add: aPlotMorph.
	aPlotMorph stack: self.
	title ifNotNil: [ aPlotMorph title: title ].
	self
		 adjustLimits ;
		 rebuildPlots