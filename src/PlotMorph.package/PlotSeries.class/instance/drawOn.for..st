drawing
drawOn: aCanvas for: aPlotMorph 
	points isEmpty ifTrue: [ ^ self ].
	drawArea ifTrue:
		[ type caseOf: {
			[ #line ] -> [ self drawStraightenedAreaOn: aCanvas for: aPlotMorph ].
			[ #stepped ] -> [ self drawSteppedAreaOn: aCanvas for: aPlotMorph ].
			[ #bar ] -> [ self drawBarOn: aCanvas for: aPlotMorph fillColor: self lineColor ]} ].
	drawLine ifTrue:
		[ type caseOf: {
			[ #line ] -> [ self drawStraightenedLineOn: aCanvas for: aPlotMorph ].
			[ #stepped ] -> [ self drawSteppedLineOn: aCanvas for: aPlotMorph ].
			[ #bar ] -> [ self drawBarOn: aCanvas for: aPlotMorph fillColor: Color transparent ]} ].
	drawPoints ifTrue: [ self drawPointsOn: aCanvas for: aPlotMorph]