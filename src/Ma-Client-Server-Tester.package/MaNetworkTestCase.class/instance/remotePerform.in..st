players
remotePerform: selectorSymbol in: playerName 
	^ self
		remotePerform: selectorSymbol
		withArguments: Array empty
		in: playerName