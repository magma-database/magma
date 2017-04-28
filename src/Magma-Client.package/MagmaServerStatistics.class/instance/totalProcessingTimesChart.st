chart
totalProcessingTimesChart
	^ StackedPlotMorph new
		 addPlot: (self newIngressPlotOn: #total) ;
		 addPlot: (self newProcessingPlotOn: #total) ;
		 addPlot: (self newEgressPlotOn: #total)