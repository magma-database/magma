event handling
mouseStillDown: aMouseMoveEvent 
	| dataPoint |
	dataPoint := self unscale: aMouseMoveEvent cursorPoint - self topLeft.
	leftSelectedX := leftSelectedX
		ifNil: [ dataPoint x ]
		ifNotNil: [ leftSelectedX min: dataPoint x ].
	rightSelectedX := rightSelectedX
		ifNil: [ dataPoint x ]
		ifNotNil: [ rightSelectedX max: dataPoint x ]