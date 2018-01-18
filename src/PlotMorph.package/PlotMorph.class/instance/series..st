series
series: nameOrSeries 
	"Answer the series whose name matches nameOrSeries.  If none match, create a new one and answer that one."
	| desiredName |
	desiredName := nameOrSeries isString
		ifTrue: [ nameOrSeries ]
		ifFalse: [ nameOrSeries name ].
	^ series
		detect: [ : each | each name = desiredName ]
		ifNone: [ self addSeries: (PlotSeries name: desiredName) ]