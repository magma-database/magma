*ma files additions-private
contributeStatisticsTo: aDirectoryEntryDirectory 
	"Add my size information to the cumulative total in aDirectoryEntryDirectory."
	self initializeStatistics.
	aDirectoryEntryDirectory
		addToTotalSize: self totalFileSize ;
		addToDirectoryCount: self directoryCount ;
		addToFileCount: self fileCount