*ma files additions
directoryCountStat
	"Statistics about the number of directories per folder."
	^ self 
		attributeNamed: #directoryCountStat
		ifAbsent: 
			[ self
				initializeStatistics ;
				directoryCountStat ]