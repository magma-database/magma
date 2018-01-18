private
shouldPlot: aPoint 
	^ (aPoint x
		between: self limitMinX
		and: self limitMaxX) and: [ (xValuesToSkip includes: aPoint x) not ]