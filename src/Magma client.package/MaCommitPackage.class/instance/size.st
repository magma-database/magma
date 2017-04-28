accessing
size
	self maMarked: 'dev'.  "If you can get rid of ensurePreparedToAllocateNewOids:, then you should be able to get rid of this."
	^objects size