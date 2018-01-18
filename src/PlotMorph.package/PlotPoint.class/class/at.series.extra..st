instance creation
at: aPoint series: aPlotSeries extra: anObject 
	^ self new
		initializeAt: aPoint
		series: aPlotSeries
		extra: anObject