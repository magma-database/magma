*writebarrier
ensureUncompact
self maMarked: 'delete'.
	self indexIfCompact > 0 ifTrue:
		[self canUncompact
			ifTrue: [self becomeUncompact]
			ifFalse: [ self error: 'Cannot uncompact ', self name]]