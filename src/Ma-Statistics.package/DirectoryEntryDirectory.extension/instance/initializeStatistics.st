*ma-statistics
initializeStatistics
	"Enumerate my entire directory tree to gather my statistics."
	| directoryAndFileCount |
	self
		fileSizeStat: MaStat new ;
		fileCountStat: MaStat new ;
		directoryCountStat: MaStat new.
	directoryAndFileCount := {  0. 0  }.
	self asFileDirectory entries in: 
		[ : myEntries | 
		myEntries
			do: [ : eachEntry | eachEntry contributeStatisticsTo: self ] ;
			do: [ : eachEntry | eachEntry incrementDirectoryOrFileCount: directoryAndFileCount ] ].
	self
		addToDirectoryCount: (directoryAndFileCount at: 1) ;
		addToFileCount: (directoryAndFileCount at: 2)