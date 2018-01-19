plot
plot: datasets on: aPlotMorph 
	^ (Smalltalk classNamed: #PlotMorph) ifNotNil: 
		[ : plotMorphClass | 
		| pm |
		pm := plotMorphClass new
			xAxisFormatter: [ : n | (DateAndTime fromSeconds: n) mauiName ] ;
			title: self name ;
			yourself.
		datasets do: 
			[ : eachSelector | 
			| series |
			series := (pm series: eachSelector) color: (self colorFor: eachSelector).
			self allStats do: 
				[ : eachStat | 
				| point |
				point := eachStat startTime asSeconds @ (eachStat perform: eachSelector).
				series 
					addPoint: point
					extra: eachStat ] ].
		pm ]