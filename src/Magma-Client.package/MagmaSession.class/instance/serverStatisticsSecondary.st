performance
serverStatisticsSecondary
	"Answer the MagmaServerStatistics in the secondary server.  Calls #serverStatistics."
	^ self 
		submit: MagmaServerStatisticsRequest new
		to: secondaryLink