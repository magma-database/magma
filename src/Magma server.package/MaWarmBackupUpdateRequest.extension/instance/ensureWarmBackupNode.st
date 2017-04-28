*magma server
ensureWarmBackupNode
	requestingLocation isReachable ifFalse: 
		[ MagmaEnvironmentError signal: requestingLocation asString , ' could not be made a warm backup because it is not reachable from ' , self thisLocation asString ].
	(repositoryController node locations includes: requestingLocation) ifFalse: 
		[ "Note, the following commit also fires-off an (async) WriteRequest to this newly-joined secondary."
		repositoryController session commit: [ repositoryController node addLocation: requestingLocation ] ]