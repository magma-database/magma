private
nextPointAfter: xPosition ifCloserThan: distanceFromLastPoint 
	| searchBoundary currentIndex |
	searchBoundary := xPosition + distanceFromLastPoint min: scaledPoints size.
	currentIndex := xPosition.
	[ currentIndex < searchBoundary ] whileTrue:
		[ (scaledPoints at: currentIndex) ifNotNil:
			[ : points | ^ points ].
		currentIndex := currentIndex + 1 ].
	"Didn't find it ahead, so search backward."
	currentIndex := xPosition.
	[ currentIndex >= 1 ] whileTrue:
		[ (scaledPoints at: currentIndex) ifNotNil:
			[ : points | ^ points ].
		currentIndex := currentIndex - 1 ].
	^ nil