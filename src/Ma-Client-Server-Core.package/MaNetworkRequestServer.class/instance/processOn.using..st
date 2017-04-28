start / stop
processOn: portNumber using: yourProcessor 
	"Listen on portNumber in the background.  For each client request received, send value: to yourProcessor (so yourProcessor must be a Block or respond to #value:).  I queue all requests and ensure your yourProcessor will never be evaluating more than one client-request at a time.  The argument to the value: message is an instance of MaClientServerRequest, of which you create application-specific subclasses."
	processor := yourProcessor.
	self processOn: portNumber