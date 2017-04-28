framework
setUpSuite
	super setUpSuite.
	self
		playerLinks: Dictionary new ;
		initializeNextPort ;
		setUpPlayers ;
"		validate ;
		warn ;"
		launchPlayerImages ;
		playerPostLaunchInitialization.
	^ self isConductorImage