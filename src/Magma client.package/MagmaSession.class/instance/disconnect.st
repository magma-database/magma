connections
disconnect
	"Disconnect this session from the repository.  If the repository is a locally-connected one, it will remain open."
	guard critical: 
		[ ConnectedSessions
			remove: self
				ifAbsent: 
					[ "do nothing"
					 ] ;
			changed.
		self primDisconnect ]