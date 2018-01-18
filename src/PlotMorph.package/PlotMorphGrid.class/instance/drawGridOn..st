drawing
drawGridOn: aCanvas 
	| gridColor xCount yCount drawBounds xLabelAdjustment yLabelAdjustment |
	gridColor := plot gridColor.
	drawBounds := plot drawBounds.
	xLabelAdjustment := [ : str | (plot font widthOfString: str) / 2 @ -8 ].
	yLabelAdjustment := [ : str | | font |
	font := plot font.
	plot right - plot margin x - (font widthOfString: str) @ (plot top - (font height / 2)) ].
	xCount := yCount := 0.
	"Must do the labels first, because their width affects the drawing of the grid-lines."
	self
		
		gridPositionsAlong: #height
		do:
			[ : dataMarker | | scaled pos str |
			scaled := plot scale: plot minPoint x @ dataMarker.
			pos := plot borderWidth + (0 @ scaled y) + (yLabelAdjustment value: (str := plot yAxisGridUnit labelFor: (plot formattedY: dataMarker))).
			(yCount = 0 or: [ (self yLabelAt: yCount) bottom - pos y > 10 ]) ifTrue:
				[ (self yLabelAt: (yCount := yCount + 1))
					 contents: str ;
					 position: pos ] ] ;
		 trimYlabelsTo: yCount ;
		
		gridPositionsAlong: #width
		do:
			[ : dataMarker | | scaled pos str |
			scaled := plot scale: dataMarker @ plot minPoint y.
			pos := plot topLeft + plot borderWidth + (scaled x @ drawBounds bottom) - (xLabelAdjustment value: (str := plot xAxisGridUnit labelFor: (plot formattedX: dataMarker))).
			(xCount = 0 or: [ pos x - (self xLabelAt: xCount) right > 10 ]) ifTrue:
				[ (self xLabelAt: (xCount := xCount + 1))
					 contents: str ;
					 position: pos ] ] ;
		 trimXlabelsTo: xCount ;
		
		gridPositionsAlong: #width
		do:
			[ : dataMarker | aCanvas
				line: (plot scale: dataMarker @ plot minPoint y)
				to: (plot scale: dataMarker @ plot maxPoint y)
				color: gridColor ] ;
		
		gridPositionsAlong: #height
		do:
			[ : dataMarker | aCanvas
				line: (plot scale: plot minPoint x @ dataMarker)
				to: (plot scale: plot maxPoint x @ dataMarker)
				color: gridColor ]