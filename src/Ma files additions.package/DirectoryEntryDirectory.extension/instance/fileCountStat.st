*ma files additions
fileCountStat
	"Statistics about the number of files per folder."
	^ self 
		attributeNamed: #fileCountStat
		ifAbsent: 
			[ self
				initializeStatistics ;
				fileCountStat ]