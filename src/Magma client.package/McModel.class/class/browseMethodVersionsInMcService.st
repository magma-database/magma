services
browseMethodVersionsInMcService
	^ ServiceAction
		id: #browseMethodVersionsInMc
		text: 'browse mc versions'
		button: 'mc'
		description: 'Browse the Monticello history of this method from the code repository.'
		action:
			[ : aBrowserRequestor | aBrowserRequestor browseMethodVersionsInMc ]
		condition:
			[ : aBrowserRequestor | aBrowserRequestor canBrowseMcMethodVersions ]