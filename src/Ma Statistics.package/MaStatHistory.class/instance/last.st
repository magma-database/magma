accessing
last
	^ self guard critical: 
		[ self isActive 
			ifTrue: [ active last ]
			ifFalse: [ 0 ] ]