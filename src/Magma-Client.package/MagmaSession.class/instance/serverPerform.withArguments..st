accessing
serverPerform: selectorSymbol withArguments: anArray 
	"Tell the server to perform selectorSymbol with arguments specified in anArray.  The actual receiver of the perform request is the MagmaRepositoryController itself.
	IMPORTANT:  Make absolutely certain you do not extend the #protocol (via anArray arguments OR the response)!
	IMPORTANT:  While this perform is executing on the server, all other requests are blocked, therefore be sure its execution will be very brief!"
	^ self submit: 
		(MaServerPerformRequest new
			selector: selectorSymbol ;
			arguments: anArray ;
			yourself)