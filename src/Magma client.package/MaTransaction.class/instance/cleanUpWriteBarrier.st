initializing
cleanUpWriteBarrier
	commitPackage objectsDo: 
		[ : each | 
		"#writeBarrier is a method dynaically compiled by the WriteBarrier framework."
		(each isBehindWriteBarrier and: [ each writeBarrier == self ]) ifTrue: [ self remove: each ] ].
	self resetCommitPackage