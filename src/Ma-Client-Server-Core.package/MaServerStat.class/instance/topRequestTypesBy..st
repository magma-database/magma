chart
topRequestTypesBy: operatorSymbol 
	| stats colors nextStat plot stack |
	plot := nil.
	stack := StackedPlotMorph new.
	stats := (self
		top: requestProcessingTimeHistorys size
		requestTypesBy: operatorSymbol) readStream.
	[ (nextStat := stats next) notNil ] whileTrue:
		[ plot ifNil:
			[ plot := (#(#total #sum ) includes: operatorSymbol)
				ifTrue: [ self newDateAndTimeBySizesPlot ]
				ifFalse: [ self newDateAndTimeBySecondsPlot ].
			colors := (self colorsForRankings: 4) readStream ].
		plot addSeries: ((nextStat seriesOn: operatorSymbol) color: colors next).
		plot series size = 4 ifTrue:
			[ stack addPlot: plot.
			plot := nil ] ].
	^ stack