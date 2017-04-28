chart
meanProcessingTimesChart
	^ StackedPlotMorph new
		 addPlot: (self newIngressPlotOn: #mean) ;
		 addPlot: (self newProcessingPlotOn: #mean) ;
		 addPlot: (self newEgressPlotOn: #mean)