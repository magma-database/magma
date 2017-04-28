accessing
lastKnownSize
	self isLoaded ifFalse: 
		[ segment := self 
			getSegmentContaining: 1
			withObjects: true.
		(segment notNil and: [ collection isNewCollection not ]) ifTrue: [ self mergeChanges ] ].
	^ segment 
		ifNil: [ 0 ]
		ifNotNil: [ segment lastKnownSize ]