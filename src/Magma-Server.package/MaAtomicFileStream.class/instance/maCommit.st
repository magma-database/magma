commit
maCommit
	"writers, write!  If shouldFlush is true, only flush if I actually wrote something (if an unconditional flush is needed, use #flush)."
	guard critical:
		[ | needsFlush |
		needsFlush := false.
		self writersDo:
			[ : each | each write.
			needsFlush := true ].
		needsFlush ifTrue:
			[ self initializeWriters.
			self physicalFlush ] ]