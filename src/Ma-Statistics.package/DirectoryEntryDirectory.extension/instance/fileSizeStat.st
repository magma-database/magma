*ma-statistics
fileSizeStat
	^ self 
		attributeNamed: #fileSizeStat
		ifAbsent: 
			[ self
				initializeStatistics ;
				fileSizeStat ]