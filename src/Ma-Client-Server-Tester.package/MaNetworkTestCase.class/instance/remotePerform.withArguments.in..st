players
remotePerform: selectorSymbol withArguments: anArray in: playerName 
	MaTestCaseNotification signal: 'remote performing ' , selectorSymbol , ' with arguments ' , anArray printString , ' in ' , playerName.
	^ (self playerLinkNamed: playerName)
		remotePerform: selectorSymbol
		withArguments: anArray