example
example1
	| goog rsi |
	goog := PlotMorph example1.
	rsi := PlotMorph example2.
	^ self new
		 addPlot: goog ;
		 addPlot: rsi ;
		 yourself