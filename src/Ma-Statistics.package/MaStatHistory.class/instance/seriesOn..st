chart
seriesOn: attribute 
	| series |
	series := PlotSeries name: attribute, ' ', self name.
	series type: #bar; drawArea: false.
	history do:
		[ : each | | y |
		y := each perform: attribute.
		y ifNotNil: [ series addPoint: each endTime asSeconds @ y ] ].
	^ series