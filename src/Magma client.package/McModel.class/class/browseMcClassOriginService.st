services
browseMcClassOriginService
	^ ServiceAction
		id: #browseMcClassOrigin
		text: 'browse mc origin'
		button: 'mc'
		description: 'Browse the Monticello version comments in which this class definition was originally committed.'
		action:
			[ : aBrowserRequestor | aBrowserRequestor browseMcClassOrigin ]
		condition:
			[ : aBrowserRequestor | aBrowserRequestor canBrowseMcClassVersions ]