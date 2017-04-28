chart
countProcessingTimesChart
	^ StackedPlotMorph new
		 addPlot: (self newIngressPlotOn: #count) ;
		 addPlot: (self newProcessingPlotOn: #count) ;
		 addPlot: (self newEgressPlotOn: #count)