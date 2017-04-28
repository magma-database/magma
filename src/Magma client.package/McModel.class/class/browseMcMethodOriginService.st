services
browseMcMethodOriginService
	^ ServiceAction
		id: #browseMcMethodOrigin
		text: 'browse mc origin'
		button: 'mc'
		description: 'Browse the Monticello version comments in which this version of this method was originally committed.'
		action:
			[ : aBrowserRequestor | aBrowserRequestor browseMcMethodOrigin ]
		condition:
			[ : aBrowserRequestor | aBrowserRequestor canBrowseMcMethodVersions ]