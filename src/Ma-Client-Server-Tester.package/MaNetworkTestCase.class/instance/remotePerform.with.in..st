players
remotePerform: selectorSymbol with: arg1 in: playerName 
	^ self
		remotePerform: selectorSymbol
		withArguments: {arg1}
		in: playerName