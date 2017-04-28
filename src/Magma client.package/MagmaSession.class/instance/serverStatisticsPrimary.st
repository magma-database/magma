performance
serverStatisticsPrimary
	"Answer the MagmaServerStatistics in the primary server."
	^ self 
		submit: MagmaServerStatisticsRequest new
		to: primaryLink