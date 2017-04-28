players
remotePerform: selectorSymbol with: arg1 in: playerName 
	^ (self playerLinkNamed: playerName) 
		remotePerform: selectorSymbol
		withArguments: (Array with: arg1)