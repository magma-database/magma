access
remotePerform: selectorSymbol withArguments: anArray

	MaArmoredCodeNotification signal: 'remote performing ', selectorSymbol, ' with arguments ', anArray printString, ' in ', name.
	^self submit:
		(MaRemotePerformRequest new
			selector: selectorSymbol;
			arguments: anArray)