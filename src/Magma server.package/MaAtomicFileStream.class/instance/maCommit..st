commit
maCommit: shouldFlush 
	"writers, write!  If shouldFlush is true, only flush if I actually wrote something (if an unconditional flush is needed, use #flush)."
	| needsFlush |
	guard critical: 
		[ needsFlush := false.
		self writersDo: 
			[ : each | 
			each write.
			needsFlush := true ].
		self initializeWriters.
		(shouldFlush and: [ needsFlush ]) ifTrue: [ self physicalFlush ] ]