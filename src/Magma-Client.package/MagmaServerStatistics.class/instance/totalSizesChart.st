chart
totalSizesChart
	^ StackedPlotMorph new
		 addPlot: (self newQueueSizesPlotOn: #total) ;
		 addPlot: (self newRequestResponseSizesPlotOn: #total) ;
		 addPlot: (self newConnectionsPlotOn: #total)