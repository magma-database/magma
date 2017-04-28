chart
maxSizesChart
	^ StackedPlotMorph new
		 addPlot: (self newQueueSizesPlotOn: #max) ;
		 addPlot: (self newRequestResponseSizesPlotOn: #max) ;
		 addPlot: (self newConnectionsPlotOn: #max)