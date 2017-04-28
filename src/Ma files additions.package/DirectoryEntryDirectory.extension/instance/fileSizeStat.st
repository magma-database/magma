*ma files additions
fileSizeStat
	^ self 
		attributeNamed: #fileSizeStat
		ifAbsent: 
			[ self
				initializeStatistics ;
				fileSizeStat ]