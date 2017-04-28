client side
remotePerform: selectorSymbol 
	"Perform selectorSymbol on my server's processor in my player image."
	^ self
		remotePerform: selectorSymbol
		withArguments: Array empty