chart-private
newConnectionsPlotOn: operatorSymbol
	^ self newDateAndTimeBySizesPlot
		 title: 'Connections / Disconnections' ;
		 addSeries: ((numberOfClientConnectionsHistory seriesOn: operatorSymbol) color: Color green) ;
		 addSeries: ((clientTimeoutsHistory seriesOn: operatorSymbol) color: Color red) ;
		 yourself