chart-private
newRequestResponseSizesPlotOn: operatorSymbol
	^ self newDateAndTimeBySizesPlot
		 title: operatorSymbol, ' Bytes Received / Sent' ;
		 addSeries: ((requestSizeHistory seriesOn: operatorSymbol) color: Color green) ;
		 addSeries: ((responseSizeHistory seriesOn: operatorSymbol) color: Color red) ;
		 yourself