setup-teardown
tearDown
	orchestra isConductorImage ifTrue:
		[ orchestra
			 shutDownPlayers ;
			 deleteImages ]