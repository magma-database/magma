accessing
transition
	^ self guard critical: 
		[ self isActive ifTrue: [ self archiveActive ].
		self resetTimer.
		active := MaHistoricalStat name: self name ]