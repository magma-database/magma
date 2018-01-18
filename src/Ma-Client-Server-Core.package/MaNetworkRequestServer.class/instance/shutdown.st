start / stop
shutdown
	socket shutdown.
	"socket shutdown immediately disallows any more requests, but blocks until pending requests get processed.  Those remaining requests which are not finished writing responses can and will continue to write, but the server is no longer needed and able to shutdown."
	super shutdown
