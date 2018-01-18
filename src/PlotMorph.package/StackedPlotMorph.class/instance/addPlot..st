sub-plots
addPlot: aPlotOrStackedPlotMorph
	aPlotOrStackedPlotMorph plotsDo: [ : each | self primAddPlot: each ]