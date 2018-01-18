drawing
scalePoints
	scaledPoints := nil.
	xValuesToSkip removeAll.
	series do:
		[ : each | | priorPoint priorPlotPoint |
		priorPoint := priorPlotPoint := nil.
		each
			pointsToPlotOn: self
			do:
				[ : eachPlotPoint | | scaledPoint |
				eachPlotPoint scaledPoint: (scaledPoint := self scale: eachPlotPoint).
				priorPoint ifNotNil:
					[ "Special feature:  If the domain's x values are equal, then don't skip that x so a vertical line can be drawn on the chart."
					(scaledPoint x = priorPoint x and: [ eachPlotPoint x ~= priorPlotPoint x ]) ifTrue: [ xValuesToSkip add: eachPlotPoint x ] ].
				priorPlotPoint := eachPlotPoint.
				priorPoint := scaledPoint ] ]