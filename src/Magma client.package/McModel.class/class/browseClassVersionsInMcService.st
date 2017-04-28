services
browseClassVersionsInMcService
	^ ServiceAction
		id: #browseClassVersionsInMc
		text: 'browse mc versions'
		button: 'mc'
		description: 'Browse the Monticello history of this class'' definitions from the code repository.'
		action:
			[ : aBrowserRequestor | aBrowserRequestor browseClassVersionsInMc ]
		condition:
			[ : aBrowserRequestor | aBrowserRequestor canBrowseMcClassVersions ]