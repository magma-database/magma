players
remotePerform: selectorSymbol withArguments: anArray in: playerName 
	^ (self playerLinkNamed: playerName) 
		remotePerform: selectorSymbol
		withArguments: anArray