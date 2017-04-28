players
remotePerform: selectorSymbol in: playerName 
	^ (self playerLinkNamed: playerName) 
		remotePerform: selectorSymbol
		withArguments: Array new