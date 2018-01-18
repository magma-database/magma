drawing
drawStraightenedAreaOn: aCanvas for: aPlotMorph 
	| areaColor |
	areaColor := self areaColor.
	aCanvas
		drawPolygon:
			(points
				select: [ : each | aPlotMorph shouldPlot: each ]
				thenCollect: [ : each | each scaledPoint ])
		color: areaColor
		borderWidth: 0
		borderColor: areaColor