example
test
	| pm |
	pm := PlotMorph new.
	pm
		 color: Color black ;
		 extent: 320 @ 320 ;
		 borderWidth: 2 ;
		 setBorderStyle: #raised ;
		 title: 'Some test functions' ;
		 limitMaxX: 500 ;
		 limitMinX: -100 ;
		 limitMinY:  -3.0 ;
		 limitMaxY:  3.0.
	pm
		series: #sin
		color: Color red ;
		
		series: #cos
		color: Color blue ;
		
		series: #test
		color: Color yellow.
	pm
		
		series: #sin
		drawArea: true ;
		
		series: #cos
		drawArea: true ;
		
		series: #test
		drawArea: true.
	pm
		series: #test
		type: #stepped.
	pm
		
		series: #sin
		width: 2 ;
		
		series: #sin
		drawLine: false.
	pm yAxisFormatter:
		[ : y | y printShowingDecimalPlaces: 4 ].
	0
		to: 360
		by: 10
		do:
			[ : x | pm
				series: #sin
				addPoint: x @ x degreesToRadians sin.
			pm
				series: #cos
				addPoint: x @ x degreesToRadians cos.
			pm
				series: #test
				addPoint: x @ (x degreesToRadians cos + x degreesToRadians sin) ].
	pm openInWorld