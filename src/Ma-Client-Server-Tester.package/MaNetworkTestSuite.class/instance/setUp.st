setup-teardown
setUp
	World color: ((Color random) adjustSaturation: -0.5 brightness: 0.0).
	MaClientServerPreferences debug: true.
	self launchOrchestra.
	self orchestra isConductorImage ifTrue: [ self findATranscript ]