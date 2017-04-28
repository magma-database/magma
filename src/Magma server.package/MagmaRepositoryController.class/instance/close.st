accessing
close
	"requestCritical: in case an extractProcess managed to queue one last request in at the last second.."
	self requestCritical: 
		[ self class controllersGuard: 
			[ OpenControllers 
				remove: self
				ifAbsent: 
					[ "do nothing"
					 ] ].
		self primClose ]