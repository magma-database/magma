chart-private
newQueueSizesPlotOn: operatorSymbol
	^ self newDateAndTimeBySizesPlot
		 title: 'Queue Sizes' ;
		 addSeries: ((socketsQueuedHistory seriesOn: operatorSymbol) color: Color blue) ;
		 addSeries: ((requestsQueuedHistory seriesOn: operatorSymbol) color: Color blue muchLighter) ;
		 yourself