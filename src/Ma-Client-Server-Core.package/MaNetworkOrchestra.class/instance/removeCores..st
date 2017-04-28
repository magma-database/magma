core-management
removeCores: anInteger
	"Decrease the number of cores used to process by anInteger.  Already-running players are unaffected, when they finish new players will not launch until cores area available."
	guard critical: [self maxCores: cores size-anInteger ]