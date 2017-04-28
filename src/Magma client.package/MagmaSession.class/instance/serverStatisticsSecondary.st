performance
serverStatisticsSecondary
	"Answer the MagmaServerStatistics in the secondary server."
	^ self 
		submit: MagmaServerStatisticsRequest new
		to: secondaryLink