private
resetActive
	self isActive ifTrue: [ self archiveActive ].
	active := MaHistoricalStat name: self name