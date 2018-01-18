private-chart
newDateAndTimeBySecondsPlot
	^ PlotMorph new
		 xAxisFormatter:
		[ : seconds | (DateAndTime fromSeconds: seconds) maAbbreviatedString ] ;
		yAxisFormatter:
		[ : milliseconds | (milliseconds // 1000) asString, 's'  ] ;
		 yourself