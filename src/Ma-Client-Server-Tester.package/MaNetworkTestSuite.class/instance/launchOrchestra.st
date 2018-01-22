setup-teardown
launchOrchestra
	MaClientServerPreferences debug: true.
	(orchestra := self createOrchestra) launch.
	orchestra isConductorImage ifTrue: [ orchestra waitForAllPlayersReady ]