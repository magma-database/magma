performance
timeoutSeconds
	"For MagmaRemoteLocations only, the number of seconds the client should wait for a response from the remote server.  If, after that time, a response is not received, a MaNetworkError will be signaled."
	^ primaryLink timeoutSeconds