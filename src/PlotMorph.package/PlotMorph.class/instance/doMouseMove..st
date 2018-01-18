event handling
doMouseMove: anEvent 
	anEvent hand submorphs isEmpty ifFalse:
		[ self hideCrosshair.
		^ self ].
	lastHandPosition := anEvent position.
	self showXFor: anEvent.
	((self drawBounds translateBy: self topLeft) containsPoint: anEvent cursorPoint) ifTrue: [ self showYFor: anEvent ].
	self metaElementsChanged