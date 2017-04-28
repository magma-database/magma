public
remove: anObject 
	anObject isBehindWriteBarrier ifTrue:
		[ anObject writeBarrier == self ifFalse: [ ^ self ].
		anObject primitiveChangeClassTo: anObject class superclass basicNew ]