initializing
addPlayerNamed: aString at: hostName port: anInteger 
	"The player must first be running and listening on port anInteger."
	self playerLinks 
		at: aString
		put: (MaNetworkTestPlayerFacade 
				name: aString
				host: hostName
				port: anInteger
				testCaseClass: self).
	MaClientServerPreferences debug: true.
	(self playerLinkNamed: aString) timeoutSeconds: 172800	"2 days"