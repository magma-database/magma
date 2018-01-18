drawing
scale: dataPoint 
	"Convert dataPoint from data values to an integral pixel point within my full canvas bounds."
	| scaleFrom scaleTo cartesianCanvasPoint height |
	scaleFrom := self minPoint rect: self maxPoint.
	(scaleFrom width isZero or: [ scaleFrom height isZero ]) ifTrue: [ scaleFrom := scaleFrom topLeft - 1 rect: scaleFrom bottomRight + 1 ].
	scaleTo := self drawBounds.
	cartesianCanvasPoint := dataPoint
		scaleFrom: scaleFrom
		to: scaleTo.
	height := self height - (self borderWidth * 2).
	^ cartesianCanvasPoint x @ (height - cartesianCanvasPoint y)