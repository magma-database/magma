drawing
unscale: canvasPoint 
	"Convert canvasPoint to data-value point."
	| scaleFrom scaleTo height cartesianCanvasPoint |
	height := self height - (self borderWidth * 2).
	scaleFrom := self drawBounds.
	scaleTo := self minPoint corner: self maxPoint..
	cartesianCanvasPoint := canvasPoint x @ (height - canvasPoint y).
	^ cartesianCanvasPoint
		fractionalScaleFrom: scaleFrom
		to: scaleTo