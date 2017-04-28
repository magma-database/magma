other small tests
testStaleProxyAutoReconnect
	"When a session disconnects, any existing proxies that are hit later will first look for an existing session connected to the same server, or, if not found there, try to reconnect the one it has."
	self 
		remotePerform: #performSetUpStaleProxyAutoReconnect
		in: 'client1'.
	self 
		remotePerform: #verifySetUpStaleProxyAutoReconnect
		in: 'client2'