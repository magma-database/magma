sub-plots
plotWithSeriesNamed: aString 
	^ plots detect:
		[ : each | each series anySatisfy:
			[ : eachSeries | eachSeries name = aString ] ]