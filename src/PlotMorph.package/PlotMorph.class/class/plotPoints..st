instance creation
plotPoints: aPointOrderedCollection 
	| plotMorph |
	plotMorph := PlotMorph new.
	plotMorph color: Color black twiceLighter twiceLighter;
		 title: 'Colors';
		 extent: 700 @ 300;
		 useRoundedCorners;
		 borderRaised.
	plotMorph series: #series color: Color white;
		 series: #series drawLine: false.
	aPointOrderedCollection
		do: [:e | ""
			plotMorph series: #series addPoint: e].
	plotMorph openInWorld.
	^ plotMorph