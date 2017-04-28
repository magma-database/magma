accessing
at: key put: anObject
	super
		at: key
		put: (WeakArray with: anObject).
	^ anObject