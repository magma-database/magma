private
clean
	self statistics houseCleaningTimeHistory addValue:
		(Time millisecondsToRun:
			[ self
				 bulkBecomeProxies ;
				 finalizeOids ;
				 resetLastClean ])