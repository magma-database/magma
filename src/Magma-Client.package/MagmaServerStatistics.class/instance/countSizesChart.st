chart
countSizesChart
	^ StackedPlotMorph new
		 addPlot: (self newQueueSizesPlotOn: #count) ;
		 addPlot: (self newRequestResponseSizesPlotOn: #count) ;
		"connections plot must use total."
		 addPlot: (self newConnectionsPlotOn: #total)