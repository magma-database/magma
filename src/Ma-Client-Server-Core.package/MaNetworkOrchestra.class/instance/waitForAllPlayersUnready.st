status
waitForAllPlayersUnready
	"Block until no players report ready."
	[ self
		 recoverFinishedCores ;
		 allCoresFinished ] whileFalse: [ (Delay forSeconds: 2) wait ]