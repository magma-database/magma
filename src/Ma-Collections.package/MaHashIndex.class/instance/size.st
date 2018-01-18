accessing
size
	^ guard critical: 
		[ self selectRoot.
		record numberOfChildren ]