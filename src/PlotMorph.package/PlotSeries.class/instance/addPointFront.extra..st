points
addPointFront: aPoint extra: anObject 
	(aPoint x isNaN or: [ aPoint y isNaN ]) ifFalse:
		[ points "addFirst:" add:
			(aPoint plotPointClass
				at: aPoint
				series: self
				extra: anObject) ]