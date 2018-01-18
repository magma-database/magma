sub-plots
addPlot
	| plot |
	plot := PlotMorph new.
	plots ifNotEmpty:
		[ plot
			 xAxisFormatter: plots anyOne xAxisFormatter ;
			 xAxisGridUnit: plots anyOne xAxisGridUnit ;
			 yAxisFormatter: plots anyOne yAxisFormatter ;
			 yAxisGridUnit: plots anyOne yAxisGridUnit ].
	self addPlot: plot