ui-support
serializationStats
	"Statistics related to local serialization and materialization of objects."
	^ { 
		timeToSerializeHistory.
		timeToMaterializeHistory.
		houseCleaningTimeHistory
	 }