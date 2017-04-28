start / stop
processOn: portNumber 
	"Listen on portNumber in the background.  For each client request received, evaluate my processBlock.  I queue all requests so that your block will never be evaluating more than one client-request at a time."
	socket console: console.
	socket processOn: portNumber