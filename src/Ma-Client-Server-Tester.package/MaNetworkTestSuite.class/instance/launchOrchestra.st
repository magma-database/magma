setup-teardown
launchOrchestra
	MaClientServerPreferences debug: true.
	ScreenController new fullScreenOff.
	(orchestra := self createOrchestra) launch.
	orchestra isConductorImage ifTrue: [ orchestra waitForAllPlayersReady ]