accessing
size
	"Retrieve the latest-known size from the server, regardless if I'm already loaded."
	self refresh.
	^ self lastKnownSize