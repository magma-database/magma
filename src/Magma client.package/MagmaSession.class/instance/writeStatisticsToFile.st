performance
writeStatisticsToFile
	| allStats filename |
	filename := 'magma-statistics.obj'.
	allStats := Dictionary new
		at: #statistics
			put: self statistics archivalCopy ;
		yourself.
	self isHighlyAvailable 
		ifTrue: 
			[ allStats
				at: #serverStatisticsPrimary
					put: self serverStatisticsPrimary archivalCopy ;
				at: #serverStatisticsSecondary
					put: self serverStatisticsSecondary archivalCopy ]
		ifFalse: 
			[ allStats 
				at: 'server statistics'
				put: self serverStatisticsPrimary ].
	MaObjectSerializer new 
		fileOut: allStats
		toFileNamed: filename
		in: FileDirectory default.
	FileDirectory default 
		maFileNamed: filename
		do: [ : stream | stream compressFile ]