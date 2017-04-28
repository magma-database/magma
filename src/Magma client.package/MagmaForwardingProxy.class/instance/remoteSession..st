private
remoteSession: aMagmaSession 
	"This is the session which my realObject should be retrieved from."
	cachedObject ifNotNil: 
		[ cachedObject magmaSession == aMagmaSession ifFalse: 
			[ MagmaUserError signal: 'This forwardingProxy already has determined its session.' ] ].
	session := aMagmaSession