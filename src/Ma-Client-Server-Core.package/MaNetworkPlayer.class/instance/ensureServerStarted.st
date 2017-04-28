server side
ensureServerStarted
	self server isRunning ifFalse: [ self server processOn: self port ]