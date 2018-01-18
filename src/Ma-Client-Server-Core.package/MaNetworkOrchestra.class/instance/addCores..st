core-management
addCores: anInteger
	"Increase the number of cores used to process by anInteger.  Will result in the immediate launching of new players."
	guard critical: [self maxCores: cores size+anInteger ]