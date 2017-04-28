accessing
transition
	^ self guard critical: 
		[ self isActive ifTrue: [ self archiveActive ].
		self nextStat ]