points
addPoint: aPoint extra: anObject 
	^ (aPoint x isNaN or: [ aPoint y isNaN ]) ifFalse:
		[ points add:
			(aPoint plotPointClass
				at: aPoint
				series: self
				extra: anObject) ]