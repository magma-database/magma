chart-private
newIngressPlotOn: operator 
	^ (operator = #count
		ifTrue: [ self newDateAndTimeBySizesPlot ]
		ifFalse: [ self newDateAndTimeBySecondsPlot ])
		 title: 'Ingress Times (' , operator asString , ')' ;
		 addSeries: ((timeWaitingInSocketQueueHistory seriesOn: operator) color: Color magenta twiceDarker) ;
		 addSeries: ((extractTimeHistory seriesOn: operator) color: Color green twiceDarker) ;
		 addSeries: ((timeWaitingInRequestQueueHistory seriesOn: operator) color: Color blue) ;
		 addSeries: ((timeToMaterializeHistory seriesOn: operator) color: Color cyan) ;
		 yourself