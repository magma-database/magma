high-availability
catch: thisLocation upTo: aMagmaRemoteLocation 
	"I am open on a full-backup of the repository at aMagmaRemoteLocation.  Download commit-log records until I am caught up and then I will begin receiving real-time updates from the server at aMagmaRemoteLocation."
	repository 
		catch: thisLocation
		upTo: aMagmaRemoteLocation