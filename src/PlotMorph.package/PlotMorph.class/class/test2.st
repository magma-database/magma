example
test2
	" 
	PlotMorph test2  
	"
	| pm sigmoid |
	pm := PlotMorph new.
	pm title: 'Sigmoid';
		 extent: 250 @ 250;
		 color: Color black.
	""
	pm series: #sigmoid1 color: Color red;
		 series: #sigmoid1 drawPoints: false;
		 series: #sigmoid2 color: Color blue;
		 series: #sigmoid2 drawPoints: false;
		 series: #sigmoid3 color: Color yellow;
		 series: #sigmoid3 drawPoints: false;
		 series: #sigmoid4 color: Color green;
		 series: #sigmoid4 drawPoints: false;
		 series: #sigmoid5 color: Color white;
		 series: #sigmoid5 drawPoints: false.
	""
	pm
		yAxisFormatter: [:y | (y roundTo: 0.1) asString].
	sigmoid := [:x :slope | 1 / (1 + (slope * x) negated exp)].
	-10
		to: 10
		by: 0.25
		do: [:x | 
			pm series: #sigmoid1 addPoint: x
					@ (sigmoid value: x value: 3).
			pm series: #sigmoid2 addPoint: x
					@ (sigmoid value: x value: 2).
			pm series: #sigmoid3 addPoint: x
					@ (sigmoid value: x value: 1).
			pm series: #sigmoid4 addPoint: x
					@ (sigmoid value: x value: 1 / 2).
			pm series: #sigmoid5 addPoint: x
					@ (sigmoid value: x value: 1 / 3)].
	pm openInWorld