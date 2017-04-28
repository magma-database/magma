chart-private
newEgressPlotOn: operatorSymbol
	^ (operatorSymbol = #count
		ifTrue: [ self newDateAndTimeBySizesPlot ]
		ifFalse: [ self newDateAndTimeBySecondsPlot ])
		title: 'Egress Times (', operatorSymbol asString, ')' ;
		 addSeries: ((timeToSerializeHistory seriesOn: operatorSymbol) color: Color cyan twiceDarker) ;
		 addSeries: ((timeToSendResponsesHistory seriesOn: operatorSymbol) color: (Color cyan muchLighter)) ;
		 addSeries: ((timeToLoadBuffersHistory seriesOn: operatorSymbol) color: Color red muchDarker) ;
		 yourself