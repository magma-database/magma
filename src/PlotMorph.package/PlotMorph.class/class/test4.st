example
test4
	" 
	PlotMorph test4
	"
	| pm function |
	pm := PlotMorph new.
	pm
		color: (Color blue twiceDarker twiceDarker twiceDarker alpha: 0.3);
		 extent: 300 @ 300;
		 useRoundedCorners.
	pm
		xAxisFormatter: [:x | x rounded asStringWithCommas].
	pm
		yAxisFormatter: [:y | y rounded asString].
	pm title: 'Some funny function'.
	pm series: #test2 color: Color red;
		 series: #test2 drawPoints: false.
	function := [:x | x degreesToRadians sin / 5 + ((x / 10) degreesToRadians cos + (x / 10) degreesToRadians sin) * 100].
	0
		to: 3000
		by: 5
		do: [:x | pm series: #test2 addPoint: x
					@ (function value: x)].
	pm openInWorld