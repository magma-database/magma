initialize-release
initialize
	super initialize.
	self initializeStatistics.
	playAuditorialization := false.
	soundTheme := MacsSoundTheme new