test rollback recovery
waitForServerDown: serverNameString 
	
	[ (Delay forSeconds: 2) wait.
	self class readyAt: (self playerLinkNamed: serverNameString) link port ] whileTrue: 
		[ MagmaTesterNotification signal: 'Waiting for server to shutdown..' ]