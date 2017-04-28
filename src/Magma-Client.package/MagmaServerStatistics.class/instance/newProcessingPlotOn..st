chart-private
newProcessingPlotOn: operatorSymbol
	^ (operatorSymbol = #count
		ifTrue: [ self newDateAndTimeBySizesPlot ]
		ifFalse: [ self newDateAndTimeBySecondsPlot ])
		title: 'Processing Times (', operatorSymbol asString, ')' ;
		 addSeries: ((requestProcessingTimeHistory seriesOn: operatorSymbol) color: Color yellow twiceDarker) ;
		 addSeries: ((idleTimeHistory seriesOn: operatorSymbol) color: Color green twiceDarker) ;
		 addSeries: ((flushTimeHistory seriesOn: operatorSymbol) color: Color red twiceDarker) ;
		 addSeries: ((houseCleaningTimeHistory seriesOn: operatorSymbol) color: Color red muchDarker) ;
		 yourself