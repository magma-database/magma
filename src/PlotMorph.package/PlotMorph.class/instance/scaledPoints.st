drawing
scaledPoints
	| prior lastNonNil |
	prior := nil.
	^ scaledPoints ifNil:
		[ | drawBounds |
		scaledPoints := Array new: (drawBounds := self drawBounds) width + 1.
		series do:
			[ : eachSeries | eachSeries points do:
				[ : eachPoint | | x | (eachPoint x between: self limitMinX and: self limitMaxX) ifTrue:
					[ x := eachPoint scaledPoint x - drawBounds left + 1.
					x <= scaledPoints size ifTrue:
						[ ((scaledPoints at: x) ifNil:
							[ scaledPoints
								at: x
								put: OrderedCollection new ]) add: eachPoint ] ] ] ].
		"In case fewer points than pixels, fill in remaining so that highlighting will occur even if the mouse pointer is between points."
		lastNonNil := 0.
		scaledPoints withIndexDo:
			[ : each : x | each
				ifNil:
					[ scaledPoints
						at: x
						put:
							((self
								nextPointAfter: x
								ifCloserThan: x - lastNonNil) ifNil: [ Array new ]) ]
				ifNotNil: [ lastNonNil := x ] ].
		scaledPoints ]