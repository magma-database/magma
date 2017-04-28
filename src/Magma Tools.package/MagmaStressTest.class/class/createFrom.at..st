run
createFrom: configurations at: aMagmaRemoteLocation 
	"Collect MagmaSessions connected to aMagmaRemoteLocation for each instance of configurations.  An inspector to a connected stressor is opened for each configuration.  They must be told to flood separately."
	^ configurations collect: 
		[ : each | 
		| sess stressor |
		sess := aMagmaRemoteLocation newSession user: (MagmaUser id: each printString).
		"Minute-by-minute for the last week."
		sess statistics snapshotInterval: (1 to: 60 * 24 * 7 by: 1).
		stressor := self 
			session: sess
			configuration: each.
		stressor inspect ]
