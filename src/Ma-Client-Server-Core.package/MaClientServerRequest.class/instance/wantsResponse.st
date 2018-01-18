testing
wantsResponse
	"Answer whether this request expects a response from the server.  If false, submitting this request will be sent over the socket and immediately answer nil.  The server will make the same test to detemine whether to bother sending a response.
	If true, submitting this request will block and wait for a response from the server."
	"Default is true, subclasses may override."
	^ true