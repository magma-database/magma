building
mergeTree: aMaTree at: anObject 
	self verifyIncludes: anObject.
	aMaTree withParentsDo: 
		[ : each : eachParent | 
		self 
			add: each
			asChildOf: eachParent ].
	^ aMaTree