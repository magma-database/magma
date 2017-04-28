performance
serverStatisticsPrimary
	"Answer the MagmaServerStatistics in the primary server.  Calls #serverStatistics."
	^ self 
		submit: MagmaServerStatisticsRequest new
		to: primaryLink