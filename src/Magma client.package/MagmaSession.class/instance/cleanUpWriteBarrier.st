private
cleanUpWriteBarrier
	self abort.
	transaction cleanUpWriteBarrier.
	serializer objectsDo: 
		[ : each | 
		"#writeBarrier is a method dynamically compiled by the WriteBarrier framework."
		(each isBehindWriteBarrier and: [ each writeBarrier == transaction ]) ifTrue: [ transaction remove: each ] ]