client side
remotePerform: selectorSymbol withArguments: anArray
	"Perform selectorSymbol on my server's processor in my player image.  The classes of all arguments must be part of the protocol."
	^ self submit:
		(MaRemotePerformRequest new
			 selector: selectorSymbol ;
			 arguments: anArray)