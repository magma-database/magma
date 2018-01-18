instance creation
plotSeries: aPointOrderedCollection 
	| plotMorph |
	plotMorph := PlotMorph new.
	plotMorph color: Color gray lighter;
		 title: 'Colors';
		 extent: 700 @ 300;
		 useRoundedCorners;
		 borderRaised.
	plotMorph series: #series color: Color red;
		 series: #series drawLine: false.
	aPointOrderedCollection
		do: [:e | ""
			plotMorph series: #series addPoint: e].
	plotMorph openInWorld.
	^ plotMorph