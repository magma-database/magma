chart
meanSizesChart
	^ StackedPlotMorph new
		 addPlot: (self newQueueSizesPlotOn: #mean) ;
		 addPlot: (self newRequestResponseSizesPlotOn: #mean) ;
		 addPlot: (self newConnectionsPlotOn: #mean)