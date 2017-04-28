accessing
serverPerform: selectorSymbol 
	"Tell the server to perform selectorSymbol.  The actual receiver of the perform request is the MagmaRepositoryController itself.
	IMPORTANT:  Make absolutely certain the response object will not attempt to extend the protocol!
	IMPORTANT:  While this perform is executing on the server, all other requests are blocked, therefore be sure its execution will be very brief!"
	^ self 
		serverPerform: selectorSymbol
		withArguments: #()