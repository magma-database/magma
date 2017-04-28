private-chart
newDateAndTimeBySizesPlot
	^ PlotMorph new
		 xAxisFormatter:
		[ : seconds | (DateAndTime fromSeconds: seconds) maAbbreviatedString ] ;
		yAxisFormatter:
		[ : size | size asBytesDescription ] ;
		 yourself